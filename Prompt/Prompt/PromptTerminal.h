//
//  PromptTerminal.h
//  Prompt
//
//  Created by Wess Cope on 2/12/14.
//  Copyright (c) 2014 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, PromptColor)
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

typedef NS_ENUM(NSUInteger, PromptTextStyle)
{
    PromptTextStyleNone         = 0,
    PromptTextStyleBold         = 1,
    PromptTextStyleUnderline    = 4,
    PromptTextStyleBlink        = 5,
    PromptTextStyleSwap         = 7,
    PromptTextStyleHide         = 8
};

extern NSString *const PromptTerminalEscapeString;
extern NSString *const PromptTerminalNothingString;
extern NSString *PromptSetColorForString(NSString *string, PromptColor color) __attribute((unused));
