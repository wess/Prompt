//
//  PromptApplicationDelegate.h
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Prompt, PromptOption;

@protocol PromptApplicationDelegate <NSObject>

- (NSArray *)optionsForApplication:(Prompt *)application;
- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options;

@optional
- (void)application:(Prompt *)application willRunOption:(PromptOption *)option;
- (void)application:(Prompt *)application didRunOption:(PromptOption *)option;
- (void)application:(Prompt *)application willParseArugments:(NSArray *)arguments;
- (void)application:(Prompt *)application didParseArugments:(NSDictionary *)arguments;

@end
