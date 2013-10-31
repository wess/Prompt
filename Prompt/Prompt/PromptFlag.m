//
//  PromptFlag.m
//  Prompt
//
//  Created by Wess Cope on 10/31/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptFlag.h"

@implementation PromptFlag
+ (instancetype)promptFlagWithName:(NSString *)name definition:(NSString *)definition flags:(NSArray *)flags
{
    PromptFlag *this    = [[PromptFlag alloc] init];
    this.name           = name;
    this.definition     = definition;
    this.flags          = flags;
    
    return this;
}
@end
