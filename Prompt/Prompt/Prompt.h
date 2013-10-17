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

@interface Prompt : NSObject
@end


APPKIT_EXTERN int PromptApplicationMain(int argc, char *argv[], NSString *principalClassName, NSString *delegateClassName);
