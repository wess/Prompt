//
//  PromptFlag.h
//  Prompt
//
//  Created by Wess Cope on 10/31/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PromptFlag : NSObject
@property (copy, nonatomic) NSString    *name;
@property (copy, nonatomic) NSString    *definition;
@property (copy, nonatomic) NSArray     *flags;

+ (instancetype)promptFlagWithName:(NSString *)name definition:(NSString *)definition flags:(NSArray *)flags;

@end
