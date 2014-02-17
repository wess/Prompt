//
//  PromptAttributedString.h
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PromptTerminal.h"

@interface PromptAttributedString : NSObject<NSCopying>
@property (readonly, nonatomic) NSUInteger length;

- (instancetype)initWithString:(NSString *)string;
- (void)addAttribute:(PromptTextAttribute)attribute range:(NSRange)range;
- (PromptAttributedString *)stringByAppendingString:(NSString *)string;
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;

@end
