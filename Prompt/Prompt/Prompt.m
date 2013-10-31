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
#import "PromptFlag.h"

@interface Prompt()
@property (copy, nonatomic) NSString        *command;
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
    
    __block NSString *command       = nil;
    __block NSMutableArray *keys    = [[NSMutableArray alloc] init];
    __block NSMutableArray *vals    = [[NSMutableArray alloc] init];
    
    [arguments enumerateObjectsUsingBlock:^(NSString *item, NSUInteger idx, BOOL *stop) {
        if(idx == 0)
        {
            command = item;
        }
        else
        {
            if([item rangeOfString:@"-"].location != NSNotFound || [item rangeOfString:@"--"].location != NSNotFound)
            {
                NSString *key   = [item stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
                
                if([key rangeOfString:@"="].location != NSNotFound)
                {
                    NSArray *split  = [key componentsSeparatedByString:@"="];
                    NSString *val   = split[1]?: @"";
                    
                    [keys addObject:split[0]];
                    [vals addObject:val];
                }
                else
                {
                    [keys addObject:key];
                }
            }
            else
            {
                [vals addObject:item];
            }
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
            id val = vals.count > idx? [vals objectAtIndex:idx] : @"";

            [mutableArgs setObject:@[val] forKey:key];
        }
    }];
    
    self.command    = command;
    self.arguments  = [mutableArgs copy];

}

- (void)processOptions
{
    [self.options enumerateObjectsUsingBlock:^(PromptOption *option, NSUInteger idx, BOOL *stop) {
        if([[option.command lowercaseString] isEqualToString:[self.command lowercaseString]])
        {
            if([self.delegate respondsToSelector:@selector(application:willRunCommand:forOption:)])
                [self.delegate application:self willRunCommand:self.command forOption:option];
         
            __block NSMutableDictionary *args = [self.arguments mutableCopy];
            
            if(!option.flags || option.flags.count < 1)
            {
                args = [self.arguments mutableCopy];
            }
            else
            {
                [self.arguments enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSArray *arguments, BOOL *stop) {
                    [option.flags  enumerateObjectsUsingBlock:^(PromptFlag *flag, NSUInteger idx, BOOL *stop) {
                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[cd] %@", key];
                        NSArray *filteredFlags = [flag.flags filteredArrayUsingPredicate:predicate];
                        
                        if(filteredFlags.count > 0)
                        {
                            args[flag.name] = arguments;
                            [args removeObjectForKey:key];
                        }
                    }];
                }];
                
                self.arguments = [args copy];
            }
            
            
            option.handler([args copy]);
            
            if([self.delegate respondsToSelector:@selector(application:didRunCommand:forOption:)])
                [self.delegate application:self didRunCommand:self.command forOption:option];
            
            *stop = YES;
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
