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
#import <Prompt/PromptAttributedString.h>

@implementation PromptExampleAppDelegate

- (NSArray *)optionsForApplication:(Prompt *)application
{
    PromptOption *hello = [PromptOption promptOptionWithCommand:@"hello" helpText:@"Hello world?" handler:^(NSDictionary *arguments) {
        
        PromptAttributedString *string = [[PromptAttributedString alloc] initWithString:@"Hello World!"];
        [string addAttribute:PromptColorBlue range:NSMakeRange(0, 4)];
        
        PromptPrintLine(string);
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
