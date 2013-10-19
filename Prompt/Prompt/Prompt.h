//
//  Prompt.h
//  Prompt
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef _APPKITDEFINES_H
#warning AppKit framework is required.
#endif

@protocol PromptApplicationDelegate;
@class PromptOption;

@interface Prompt : NSObject
@property (weak, nonatomic) id<PromptApplicationDelegate> delegate;

+ (instancetype)shareApplication;

@end

APPKIT_EXTERN int PromptApplicationMain(NSString *delegateClassName);
