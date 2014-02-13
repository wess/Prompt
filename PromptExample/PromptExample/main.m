//
//  main.m
//  PromptExample
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Prompt/Prompt.h>
#import <Prompt/PromptTerminal.h>
#import "PromptExampleAppDelegate.h"

int main(int argc, const char *argv[])
{

//    @autoreleasepool
//    {
//        
        NSString *string = PromptSetColorForString(@"Hello World", PromptColorGreen);
        printf("%s", string.UTF8String);

//        return PromptApplicationMain(NSStringFromClass([PromptExampleAppDelegate class]));
//    }
//
    return 0;
}

