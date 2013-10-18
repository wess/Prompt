//
//  Prompt.m
//  Prompt
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "Prompt.h"
#import <Foundation/Foundation.h>

int PromptApplicationMain(int argc, char *argv[], NSString *principalClassName, NSString *delegateClassName)
{

    return 0;
}

@interface Prompt()
@property (readonly, nonatomic) NSDictionary *args;

+ (instancetype)sharedInstance;
@end

@implementation Prompt
@synthesize args = _args;

+ (instancetype)sharedInstance
{
    static id _instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}


- (NSDictionary *)args
{
    if(_args)
        return _args;
    
    NSMutableArray *processArguments = [[[NSProcessInfo processInfo] arguments] mutableCopy];
    [processArguments removeObjectAtIndex:0];
    
    return @{};
}

@end