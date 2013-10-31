//
//  PromptInput.h
//  Prompt
//
//  Created by Wess Cope on 10/19/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PromptInputHandler)(NSString *response);

@interface PromptInput : NSObject
@property (nonatomic) BOOL isSecure;

+ (void)promptUser:(NSString *)prompt completionHandler:(PromptInputHandler)handler;
+ (void)promptUser:(NSString *)prompt isSecure:(BOOL)isSecure completionHandler:(PromptInputHandler)handler;
+ (void)promptUser:(NSString *)prompt length:(NSUInteger)length completionHandler:(PromptInputHandler)handler;
@end
