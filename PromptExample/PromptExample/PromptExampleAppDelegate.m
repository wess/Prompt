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
    PromptOption *foo = [PromptOption promptOptionWithCommand:@"foo" helpText:@"Foo me Baby!" handler:^(NSDictionary *arguments) {
        NSLog(@"args: %@", arguments);
    }];

    PromptOption *hello = [PromptOption promptOptionWithCommand:@"hello" helpText:@"Hello world?" handler:^(NSDictionary *arguments) {
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

@end
