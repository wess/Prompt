//
//  PromptOption.h
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PromptHandler)(NSArray *arguments, NSArray *environmentVariables);

@interface PromptOption : NSObject
@property (copy, nonatomic) NSString        *helpText;
@property (copy, nonatomic) NSArray         *flags;
@property (copy, nonatomic) PromptHandler   handler;
@property (nonatomic) BOOL                  isRequired;

+ (instancetype)promptOptionWithFlags:(NSArray *)flags required:(BOOL)isRequired helpText:(NSString *)helpText handler:(PromptHandler)handler;

@end
