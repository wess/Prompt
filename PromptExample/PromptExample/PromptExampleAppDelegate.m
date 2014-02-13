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
#import <Prompt/PromptFlag.h>
#import <Prompt/PromptTerminal.h>

@implementation PromptExampleAppDelegate

- (NSArray *)optionsForApplication:(Prompt *)application
{
    PromptOption *hello = [PromptOption promptOptionWithCommand:@"hello" helpText:@"Hello world?" handler:^(NSDictionary *arguments) {
        NSString *string = PromptSetColorForString(@"Hello World", PromptColorGreen);
        NSString *stringTwo = PromptSetColorForString(@"Hey there", PromptColorRedBackground);
        
        printf("%s%s\n", string.UTF8String, stringTwo.UTF8String);
    }];
    
    PromptFlag *a = [PromptFlag promptFlagWithName:@"AAAA" definition:@"All As" flags:@[@"f", @"foo"]];
    PromptFlag *b = [PromptFlag promptFlagWithName:@"BBBB" definition:@"All Bs" flags:@[@"h"]];
    
    hello.flags = @[a, b];

    return @[hello];
}

- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options
{
    return YES;
}

@end
