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
/**
 `PromptAttributedString is a class for creating strings with attributes, like color or styles, for printing
 to the terminal.
 */

/**
 Gives you the base string that is backing the attributed string.
 */
@property (readonly, nonatomic) NSString *string;

/**
 Length, minus attribute characters, of the string.
 */
@property (readonly, nonatomic) NSUInteger length;

/**
 Creates a new PromptAttributedString with a string.
 
 @param string NSString to create attributedString from.
 @return instance of PromptAttributedString.
 */
- (instancetype)initWithString:(NSString *)string;

/**
 Adds an attribute to the string with given range.

 @param attribute   to apply to string.
 @param range       where to apply the attribute in the string.
 */
- (void)addAttribute:(PromptTextAttribute)attribute range:(NSRange)range;

/**
 Create a new attribute string by appending a string.
 
 @param string String to append when creating a new attributed string.
 */
- (PromptAttributedString *)stringByAppendingString:(NSString *)string;

/**
 Creates a data representation of attributed string.
 
 @param encoding String encoding to use for the data.
 */
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding;

/**
 Creates a data representation of attributed string.
 
 @param encoding String encoding to use for the data.
 @param lossy Allows characters to be removed or altered in conversion.
 */
- (NSData *)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;

@end


