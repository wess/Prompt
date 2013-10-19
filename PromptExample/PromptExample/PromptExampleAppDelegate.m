//
//  PromptExampleAppDelegate.m
//  PromptExample
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptExampleAppDelegate.h"
#import <Prompt/PromptOption.h>
#import <Prompt/PromptInput.h>

@implementation PromptExampleAppDelegate

- (NSArray *)optionsForApplication:(Prompt *)application
{
    PromptOption *foo = [PromptOption promptOptionWithFlags:@[@"-f", @"--foo"] required:NO helpText:@"Testing Options" handler:^(NSArray *arguments) {
        NSLog(@"args: %@", arguments);
    }];

    PromptOption *hello = [PromptOption promptOptionWithFlags:@[@"-h", @"--hello"] required:NO helpText:@"Testing Options" handler:^(NSArray *arguments) {
        [PromptInput promptUser:@"Please enter something: " completionHandler:^(NSString *response) {
            NSLog(@"SOMETHING: %@", response);
        }];
    }];
    
    return @[foo, hello];
}

- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options
{
    return YES;
}

- (void)application:(Prompt *)application willRunWithOption:(PromptOption *)option
{
    NSLog(@"Will Run Option: %@", option.flags);
}

- (void)application:(Prompt *)application didRunWithOption:(PromptOption *)option
{
    NSLog(@"Did Run Option: %@", option.flags);
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
