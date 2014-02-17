//
//  PromptInput.h
//  Prompt
//
//  Created by Wess Cope on 10/19/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Block for handling user input.
 */
typedef void(^PromptInputHandler)(NSString *response);

@interface PromptInput : NSObject
/**
 `PromptInput` is an option flag type that will prompt a user for input and use
 the completionHandler for working with user's data.
 */

/**
 Defines if the input should be secure or not.
 */
@property (nonatomic) BOOL isSecure;

/**
 Tells the option to prompt a user with the given string, and triggers block with given response.
 */
+ (void)promptUser:(NSString *)prompt completionHandler:(PromptInputHandler)handler;

/**
 Tells the option to prompt a user with the given string, with secure entry, and triggers block with given response.
 */
+ (void)promptUser:(NSString *)prompt isSecure:(BOOL)isSecure completionHandler:(PromptInputHandler)handler;

/**
 Tells the option to prompt a user with the given string, limiting it to the provided length, and triggers block with given response.
 */
+ (void)promptUser:(NSString *)prompt length:(NSUInteger)length completionHandler:(PromptInputHandler)handler;
@end
