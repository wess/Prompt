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
@property (weak, nonatomic) id<PromptApplicationDelegate> delegate;

+ (instancetype)shareApplication;

@end

APPKIT_EXTERN int PromptApplicationMain(NSString *delegateClassName);
