//
//  PromptDelegate.h
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PromptApplicationDelegate <NSObject>

- (BOOL)application:(Prompt *)application runningWithArugments:(NSArray *)arguments;

@optional
- (void)application:(Prompt *)application willRunWithArugments:(NSArray *)arguments;
- (void)application:(Prompt *)application didRunWithArugments:(NSArray *)arguments;
- (void)application:(Prompt *)application willParseArugments:(NSDictionary *)arguments;
- (void)application:(Prompt *)application didParseArugments:(NSDictionary *)arguments;

@end
