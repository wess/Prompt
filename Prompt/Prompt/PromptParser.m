//
//  PromptParser.m
//  Prompt
//
//  Created by Wess Cope on 10/17/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import "PromptParser.h"

void parseCommandlineArguments(void(^handler)(NSDictionary *))
{
    NSProcessInfo *processInfo  = [NSProcessInfo processInfo];
    NSArray *arguments          = [processInfo.arguments subarrayWithRange:NSMakeRange(1, (processInfo.arguments.count - 1))];
    
    __block NSMutableArray *keys    = [[NSMutableArray alloc] init];
    __block NSMutableArray *vals    = [[NSMutableArray alloc] init];
    
    [arguments enumerateObjectsUsingBlock:^(NSString *item, NSUInteger idx, BOOL *stop) {
        if([item rangeOfString:@"-"].location != NSNotFound || [item rangeOfString:@"--"].location != NSNotFound)
        {
            item = [item stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"-"]];
            
            if([item rangeOfString:@"="].location != NSNotFound)
            {
                NSArray *split  = [item componentsSeparatedByString:@"="];
                NSString *key   = split[0];
                NSString *val   = split[1]?:@"";
                
                [keys addObject:key];
                [vals addObject:val];
            }
            else
            {
                [keys addObject:item];
                [vals addObject:@""];
            }
        }
        else
        {
            [vals addObject:item];
        }
        
    }];
    
    NSMutableDictionary *mutableArgs = [[NSMutableDictionary alloc] initWithCapacity:keys.count];
    [keys enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL *stop) {
        [mutableArgs setObject:vals[idx] forKey:key];
    }];
    
    handler([mutableArgs copy]);
}