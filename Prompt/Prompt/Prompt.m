//
//  Prompt.m
//  Prompt
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "Prompt.h"
#import <Foundation/Foundation.h>
#import "PromptApplicationDelegate.h"
#import "PromptOption.h"

@interface Prompt()
@property (copy, nonatomic) NSDictionary    *arguments;
@property (strong, nonatomic) NSArray       *options;

- (void)parseCommandlineArguments;
- (void)processOptions;
- (int)run;

@end

@implementation Prompt

+ (instancetype)shareApplication
{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

- (void)parseCommandlineArguments
{
    NSProcessInfo *processInfo  = [NSProcessInfo processInfo];
    NSArray *arguments          = [processInfo.arguments subarrayWithRange:NSMakeRange(1, (processInfo.arguments.count - 1))];
    
    if([self.delegate respondsToSelector:@selector(application:willParseArugments:)])
        [self.delegate application:self willParseArugments:arguments];
    
    __block NSMutableArray *keys    = [[NSMutableArray alloc] init];
    __block NSMutableArray *vals    = [[NSMutableArray alloc] init];
    
    [arguments enumerateObjectsUsingBlock:^(NSString *item, NSUInteger idx, BOOL *stop) {
        if([item rangeOfString:@"-"].location != NSNotFound || [item rangeOfString:@"--"].location != NSNotFound)
        {
            if([item rangeOfString:@"="].location != NSNotFound)
            {
                NSArray *split  = [item componentsSeparatedByString:@"="];
                NSString *key   = split[0];
                NSString *val   = split[1]?:@"";
                
                [keys addObject:key];
                [vals addObject:val];
            }
            else
            {
                [keys addObject:item];
            }
        }
        else
        {
            [vals addObject:item];
        }
        
    }];
    
    NSMutableDictionary *mutableArgs = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    [keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        
        if([mutableArgs objectForKey:key])
        {
            NSArray *arg = [mutableArgs objectForKey:key];
            [mutableArgs setObject:[arg arrayByAddingObject:vals[idx]] forKey:key];
        }
        else
        {
            id val = vals.count > idx? vals[idx] : @"";
            [mutableArgs setObject:@[val] forKey:key];
        }
    }];
    
    self.arguments = [mutableArgs copy];

    if([self.delegate respondsToSelector:@selector(application:didParseArugments:)])
        [self.delegate application:self didParseArugments:self.arguments];
}

- (void)processOptions
{
    NSArray *flags                  = [self.arguments allKeys];
    NSMutableArray *mutableOptions  = [self.options mutableCopy];
    
    [flags enumerateObjectsUsingBlock:^(NSString *flag, NSUInteger idx, BOOL *stop) {
        NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"flags CONTAINS[cd] %@", flag];
        NSArray *options        = [mutableOptions filteredArrayUsingPredicate:predicate];
        
        if(options.count > 0)
        {
            [mutableOptions removeObjectsInArray:options];
            
            NSArray *args           = [self.arguments objectForKey:flag];
            PromptOption *option    = [options lastObject];
            
            if([self.delegate respondsToSelector:@selector(application:willRunWithOption:)])
                [self.delegate application:self willRunWithOption:option];
            
            option.handler(args);
            
            if([self.delegate respondsToSelector:@selector(application:didRunWithOption:)])
                [self.delegate application:self didRunWithOption:option];
        }
        
    }];
}

- (int)run
{
    self.options = [[self.delegate optionsForApplication:self] copy];
    
    [self parseCommandlineArguments];
    [self processOptions];
    
    return [self.delegate application:self runningOptions:self.options]? EXIT_SUCCESS : EXIT_FAILURE;
}

@end

int PromptApplicationMain(NSString *delegateClassName)
{
    id<PromptApplicationDelegate> delegate  = [[NSClassFromString(delegateClassName) alloc] init];
    Prompt *app                             = [Prompt shareApplication];
    app.delegate                            = delegate;
    
    return [app run];
}
