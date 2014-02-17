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
/**
 `PromptApplicationDelegate` Protocol used to define and setup a command line application delegate object.
 */

/**
 Returns an array of options for the application to use.
 
 @param application Instance of the Prompt application.
 @return Array      Of options the application will recognized.
 */
- (NSArray *)optionsForApplication:(Prompt *)application;

/**
 Called with the application is executed and is running options.
 
 @param application Instance of the Prompt application.
 @param options     List of options the application is using.
 @return A boolean value if the application is executed correctly or not.
 */
- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options;

@optional
/**
 Optional delegate that is called when the application is about to execute a command.
 
 @param application Instance of Prompt application.
 @param command     Name of the command about to run.
 @param option      Option definition for command.
 */
- (void)application:(Prompt *)application willRunCommand:(NSString *)command forOption:(PromptOption *)option;

/**
 Optional delegate that is called when the application did execute a command.
 
 @param application Instance of Prompt application.
 @param command     Name of the command about to run.
 @param option      Option definition for command.
 */
- (void)application:(Prompt *)application didRunCommand:(NSString *)command forOption:(PromptOption *)option;

@end
