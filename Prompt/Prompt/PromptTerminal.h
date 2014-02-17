//
//  PromptTerminal.h
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Quick type to give NSUInteger a pretty name
 to match Prompt.
 */
typedef NSUInteger PromptTextAttribute;

/**
 Text color attribute for Prompt when printing to the terminal.
 */
typedef NS_ENUM(PromptTextAttribute, PromptColor)
{
    PromptColorBlack                = 30,
    PromptColorRed                  = 31,
    PromptColorGreen                = 32,
    PromptColorYellow               = 33,
    PromptColorBlue                 = 34,
    PromptColorMagenta              = 35,
    PromptColorCyan                 = 36,
    PromptColorWhite                = 37,
    PromptColorBlackBackground      = 40,
    PromptColorRedBackground        = 41,
    PromptColorGreenBackground      = 42,
    PromptColorYellowBackground     = 43,
    PromptColorBlueBackground       = 44,
    PromptColorMagentaBackground    = 45,
    PromptColorCyanBackground       = 46,
    PromptColorWhiteBackground      = 47
};

/**
 Text style for printing to the terminal.
 */
typedef NS_ENUM(PromptTextAttribute, PromptTextStyle)
{
    PromptTextStyleNone         = 0,
    PromptTextStyleBold         = 1,
    PromptTextStyleUnderline    = 4,
    PromptTextStyleBlink        = 5,
    PromptTextStyleSwap         = 7,
    PromptTextStyleHide         = 8
};


/**
 Prints text (with format) to terminal.
 
 @param output  String/Format to print to terminal.
 @param ...     Values used for string replace in the output.
 */
extern void PromptPrint(id output, ...);

/**
 Prints text line (with format) to terminal.

 @param output  String/Format to print to terminal.
 @param ...     Values used for string replace in the output.
 */
extern void PromptPrintLine(id output, ...);




