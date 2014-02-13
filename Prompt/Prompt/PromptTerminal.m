//
//  PromptTerminal.m
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import "PromptTerminal.h"

NSString *const PromptTerminalEscapeString = @"\\033[%@m%@\\033[0m";
NSString *const PromptTerminalNothingString = @"\033[0m";

NSString *PromptSetColorForString(NSString *string, PromptColor color)
{
    if(!color)
        return string;

    string = [NSString stringWithFormat:PromptTerminalEscapeString, @(color), string];
    
    return string;
}