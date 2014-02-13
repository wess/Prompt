//
//  PromptTerminal.m
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import "PromptTerminal.h"

NSString *const PromptTerminalEscapeString = @"\e[00;%@m%@%@";
NSString *const PromptTerminalNothingString = @"\e[0m";

NSString *PromptSetColorForString(NSString *string, PromptColor color)
{
    if(!color)
        return string;

    string = [NSString stringWithFormat:PromptTerminalEscapeString, @(color), string, PromptTerminalNothingString];
    
    return string;
}