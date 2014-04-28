# Prompt
Prompt is the last commandline framework you will ever need for developing Objective-C commandline applications. It uses a setup similiar to how OS X and iOS apps are built.

# Setup
Add Prompt to your project, via pod or whatevs. Just be sure to link against the static lib. Then we just have a few files to setup.


## main.m
```objectivec
// Main.m

#import <Foundation/Foundation.h>
#import <Prompt/Prompt.h>
#import "YourAppDelegate.h"

int main(int argc, const char *argv[])
{

    @autoreleasepool
    {
        return PromptApplicationMain(NSStringFromClass([YourAppDelegate class]));
    }

    return 0;
}
```

## AppDelegate.h
```objectivec
// YourAppDelegate.h

#import <Foundation/Foundation.h>
#import <Prompt/PromptApplicationDelegate.h>

@interface ExampleAppDelegate : NSObject<PromptApplicationDelegate>
@end

```

## AppDelegate.m
``` objectivec

#import <Prompt/PromptOption.h>
#import <Prompt/PromptInput.h>
#import <Prompt/PromptFlag.h>
#import <Prompt/PromptTerminal.h>
#import <Prompt/PromptAttributedString.h>

@implementation ExampleAppDelegate

- (NSArray *)optionsForApplication:(Prompt *)application
{
    PromptOption *hello = [PromptOption promptOptionWithCommand:@"hello" helpText:@"Hello world?" handler:^(NSDictionary *arguments) {
        
        PromptAttributedString *string = [[PromptAttributedString alloc] initWithString:@"Hello World!"];
        [string addAttribute:PromptColorBlue range:NSMakeRange(0, 4)];
        
        PromptPrintLine(string);
    }];
    
    PromptFlag *a = [PromptFlag promptFlagWithName:@"AAAA" definition:@"All As" flags:@[@"f", @"foo"]];
    PromptFlag *b = [PromptFlag promptFlagWithName:@"BBBB" definition:@"All Bs" flags:@[@"h"]];
    
    hello.flags = @[a, b];

    return @[hello];
}

- (BOOL)application:(Prompt *)application runningOptions:(NSArray *)options
{
    return YES;
}

@end

```

## Documentation
The headers are well documented and should be compatible with AppleDoc.

## To Do
Ability to generate Help contenxt.

## If you need me
* [Github](http://www.github.com/wess)
* [@WessCope](http://www.twitter.com/wesscope)

## License
Read LICENSE file for more info.
