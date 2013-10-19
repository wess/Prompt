//
//  PromptInput.m
//  Prompt
//
//  Created by Wess Cope on 10/19/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptInput.h"

@interface PromptInput()
@property (copy, nonatomic) PromptInputHandler handler;
@property (copy, nonatomic) NSString           *prompt;
@property (nonatomic)       NSUInteger          length;
- (void)handleStdin;
@end

@implementation PromptInput
+ (void)promptUser:(NSString *)prompt completionHandler:(PromptInputHandler)handler
{
    [[self class] promptUser:prompt length:0 completionHandler:handler];
}

+ (void)promptUser:(NSString *)prompt length:(NSUInteger)length completionHandler:(PromptInputHandler)handler
{
    PromptInput *this   = [[PromptInput alloc] init];
    this.prompt         = prompt;
    this.handler        = handler;
    this.length         = length;
    
    [this handleStdin];
}

- (void)handleStdin
{
    printf("%s", [self.prompt UTF8String]);
    
    NSFileHandle *stdin = [NSFileHandle fileHandleWithStandardInput];
    NSString *response  = nil;
    if(self.length > 0)
    {
        response = [[NSString alloc] initWithData:[stdin readDataOfLength:self.length] encoding:NSUTF8StringEncoding];
    }
    else
    {
        while(YES)
        {
            NSData *input = [stdin availableData];
            NSString *str = [[NSString alloc] initWithData:input encoding:NSUTF8StringEncoding];
            
            if([str rangeOfString:@"\n"].location != NSNotFound)
            {
                response = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                break;
            }
        }
    }
    
    if(self.handler)
        self.handler(response);
}

@end
