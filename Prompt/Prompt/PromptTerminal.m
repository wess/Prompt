//
//  PromptTerminal.m
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import "PromptTerminal.h"
#import "PromptAttributedString.h"
#import <stdarg.h>

#define PromptArguments(first_argument) \
({ \
    NSMutableArray *valist = [[NSMutableArray alloc] init]; \
    id object = nil; \
    va_list args; \
    va_start(args, output); \
    while((object == va_arg(args, id))) \
        [valist addObject:object]; \
    va_end(args); \
    [valist copy]; \
});

static NSFileHandle *handle()
{
    static NSFileHandle *handle = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        handle = [NSFileHandle fileHandleWithStandardOutput];
    });

    return handle;
}

#define handle handle()

void PromptPrint(id output, ...)
{
    NSData      *data;
    NSString    *formattedString;
    NSArray     *arguments = PromptArguments(output);
    
    if(arguments.count > 0)
    {
        NSRange range = NSMakeRange(0, arguments.count);
        NSMutableData *data = [NSMutableData dataWithLength:(sizeof(id) * arguments.count)];
        
        [arguments getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
        
        formattedString = [[NSString alloc] initWithFormat:output arguments:data.mutableBytes];
    }
    else
    {
        formattedString = [output copy];
    }
    
    data = [formattedString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    [handle writeData:data];
}

void PromptPrintLine(id output, ...)
{
    NSData      *data;
    NSString    *formattedString;
    NSArray     *arguments = PromptArguments(output);
    
    if(arguments.count > 0)
    {
        NSRange range = NSMakeRange(0, arguments.count);
        NSMutableData *data = [NSMutableData dataWithLength:(sizeof(id) * arguments.count)];
        
        [arguments getObjects:(__unsafe_unretained id *)data.mutableBytes range:range];
        
        formattedString = [[NSString alloc] initWithFormat:output arguments:data.mutableBytes];
    }
    else
    {
        formattedString = [output copy];
    }

    formattedString = [formattedString stringByAppendingString:@"\n"];
    
    data = [formattedString dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    [handle writeData:data];

}