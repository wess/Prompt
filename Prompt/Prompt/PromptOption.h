//
//  PromptOption.h
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Block used with options are triggered, passing arguments from the commandline.
 */
typedef void(^PromptOptionHandler)(NSDictionary *);

@interface PromptOption : NSObject
/**
 `PromptOption` Defines an option for the commandline program to execute.
 */

/**
 Command definition for the command line application.
 */
@property (copy, nonatomic) NSString            *command;

/**
 Gives the definition of the command to explain it's usage.
 */
@property (copy, nonatomic) NSString            *helpText;

/**
 A collection of PromptFlags the option will recognized as arguments.
 */
@property (copy, nonatomic) NSArray             *flags;

/**
 The block used when an option is used with the application.
 */
@property (copy, nonatomic) PromptOptionHandler handler;

/**
 Creates a new option for the command line app.
 
 @param command     name of command.
 @param helpText    Text used to explain command.
 @param handler     Block executed when a command is recognized.
 */
+ (instancetype)promptOptionWithCommand:(NSString *)command helpText:(NSString *)helpText handler:(PromptOptionHandler)handler;

@end
