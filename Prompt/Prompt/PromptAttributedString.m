//
//  PromptAttributedString.m
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import "PromptAttributedString.h"

@interface PromptAttributedString()
@property (copy, nonatomic) NSString    *attrString;
@end

@implementation PromptAttributedString
@synthesize string = _string;

static NSString *const PromptTerminalEscapeString   = @"\e[00;%@m%@%@";
static NSString *const PromptTerminalNothingString  = @"\e[0m";
static NSString *PromptSetAttributeForString(NSString *string, PromptTextAttribute attribute)
{
    if(!attribute)
        return string;
    
    string = [NSString stringWithFormat:PromptTerminalEscapeString, @(attribute), string, PromptTerminalNothingString];
    
    return string;
}

- (instancetype)initWithString:(NSString *)string
{
    self = [super init];
    if (self)
    {
        _string         = [string copy];
        self.attrString = [string copy];
    }
    return self;
}

- (NSUInteger)length
{
    return _string.length;
}

- (void)addAttribute:(PromptTextAttribute)attribute range:(NSRange)range
{
    NSString *subString     = [self.string substringWithRange:range];
    NSString *attrString    = PromptSetAttributeForString(subString, attribute);
    
    self.attrString = [self.attrString stringByReplacingOccurrencesOfString:subString withString:attrString];
}

- (PromptAttributedString *)stringByAppendingString:(NSString *)string
{
    self.attrString = [self.attrString stringByAppendingString:string];
    _string         = [_string stringByAppendingString:string];
    
    return [[PromptAttributedString alloc] initWithString:self.attrString];
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
