//
//  PromptOption.h
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PromptOptionHandler)(NSDictionary *);

@interface PromptOption : NSObject
@property (copy, nonatomic) NSString            *command;
@property (copy, nonatomic) NSString            *helpText;
@property (copy, nonatomic) PromptOptionHandler handler;

+ (instancetype)promptOptionWithCommand:(NSString *)command helpText:(NSString *)helpText handler:(PromptOptionHandler)handler;

@end
