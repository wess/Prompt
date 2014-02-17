//
//  PromptFlag.h
//  Prompt
//
//  Created by Wess Cope on 10/31/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PromptFlag : NSObject
/**
 `PromptFlag` is used to define flags (arguments) that are associated and used with commandline options.
 */

/**
 Name of the flag
 */
@property (copy, nonatomic) NSString    *name;

/**
 Details used to explaini the flags purpose.
 */
@property (copy, nonatomic) NSString    *definition;

/**
 Characters/strings used as arguments for a commandline option.
 */
@property (copy, nonatomic) NSArray     *flags;

/**
 Creates a new flag to be used with an option.
 
 @param name        String to define the name.
 @param definition  String that describes the flag.
 @param flags       Array of strings to define arguments.
 */
+ (instancetype)promptFlagWithName:(NSString *)name definition:(NSString *)definition flags:(NSArray *)flags;

@end
