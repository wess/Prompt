//
//  PromptAttributedString.m
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import "PromptAttributedString.h"

@interface PromptAttributedString()
@property (copy, nonatomic) NSString    *string;
@end

@implementation PromptAttributedString
{
    struct _stringAttribute {
        NSRange     range;
        NSUInteger  value;
    };
}

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self)
    {
        self.string = [string copy];
    }
    return self;
}

- (void)addAttribute:(PromptTextAttribute)attribute range:(NSRange)range
{
    NSString *subString     = [self.string substringWithRange:range];
    NSString *attrString    = PromptSetAttributeForString(subString, attribute);
    
    self.string = [self.string stringByReplacingOccurrencesOfString:subString withString:attrString];
}

- (PromptAttributedString *)stringByAppendingString:(NSString *)string
{
    self.string = [self.string stringByAppendingString:string];
    
    return self;
}

- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding
{
    return [self.string dataUsingEncoding:encoding];
}

- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy
{
    return [self.string dataUsingEncoding:encoding allowLossyConversion:lossy];
}


- (NSString *)description
{
    return self.string;
}

#pragma mark - NSCopying
- (instancetype)copyWithZone:(NSZone *)zone
{
    id copy = [[[self class] alloc] init];
    
    if(copy)
        [copy setString:self.string];
    
    return copy;
}

@end
