//
//  PromptOption.m
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptOption.h"

@implementation PromptOption
+ (instancetype)promptOptionWithFlags:(NSArray *)flags required:(BOOL)isRequired helpText:(NSString *)helpText handler:(PromptOptionHandler)handler
{
    PromptOption *this  = [[PromptOption alloc] init];
    this.flags          = flags;
    this.isRequired     = isRequired;
    this.helpText       = helpText;
    this.handler        = handler;
    
    return this;
}
@end
