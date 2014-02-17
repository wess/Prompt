//
//  Prompt.h
//  Prompt
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#ifndef _APPKITDEFINES_H
#warning AppKit framework is required.
#endif

#import <Foundation/Foundation.h>
#import "PromptApplicationDelegate.h"
#import "PromptOption.h"
#import "PromptInput.h"

@interface Prompt : NSObject
/**
 `Prompt` Root object that defines a Prompt command line application.
 */

/**
 Delegate for the application.
 */
@property (weak, nonatomic) id<PromptApplicationDelegate> delegate;

/**
 Access the current instance singleton of the application.
 */
+ (instancetype)shareApplication;

@end

/**
 Function for running a Prompt application and setting up a delegate and options.
 
 @param delegateClassName Name of the class to use when creating a Prompt application delegate.
 */
APPKIT_EXTERN int PromptApplicationMain(NSString *delegateClassName);
