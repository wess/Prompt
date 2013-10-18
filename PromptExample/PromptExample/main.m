//
//  main.m
//  PromptExample
//
//  Created by Wess Cope on 10/16/13.
//  Copyright (c) 2013 Nudge. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Prompt/Prompt.h>
#import "PromptExampleAppDelegate.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool
    {
        parseCommandlineArguments(^(NSDictionary *args) {
            NSLog(@"args: %@", args);
        });
        return 0; //PromptApplicationMain(argc, argv, nil, NSStringFromClass([PromptExampleAppDelegate class]));
    }

}

