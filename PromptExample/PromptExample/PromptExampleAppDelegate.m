//
//  PromptExampleAppDelegate.m
//  PromptExample
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptExampleAppDelegate.h"
#import <Prompt/PromptOption.h>

@implementation PromptExampleAppDelegate

- (NSArray *)optionsForApplication:(Prompt *)application
{
    PromptOption *option = [PromptOption promptOptionWithFlags:@[@"-f", @"--foo"] required:NO helpText:@"Testing Options" handler:^(NSArray *arguments) {
        NSLog(@"args: %@", arguments);
    }];
    
    return @[option];
}

- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options
{
    return YES;
}

- (void)application:(Prompt *)application willRunOptions:(NSArray *)options
{
    
}

- (void)application:(Prompt *)application didRunOptions:(NSArray *)options
{
    
}

- (void)application:(Prompt *)application willParseArugments:(NSArray *)arguments
{
    NSLog(@"PRE PARSE: %@", arguments);
}

- (void)application:(Prompt *)application didParseArugments:(NSDictionary *)arguments
{
    NSLog(@"POST PARSE: %@", arguments);
}

@end
