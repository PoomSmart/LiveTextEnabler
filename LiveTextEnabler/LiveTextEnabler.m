//
//  LiveTextEnabler.m
//  LiveTextEnabler
//
//  Created by PoomSmart on 12/7/2021.
//
//

#import <Foundation/Foundation.h>
#import <dlfcn.h>
#import "ZKSwizzle.h"

@interface VKImageAnalyzer : NSObject
@end

@interface VKImageAnalyzer_LiveTextEnabler : NSObject
@end

@implementation VKImageAnalyzer_LiveTextEnabler

+ (BOOL)deviceSupportsImageAnalysis
{
    return YES;
}

+ (void)load
{
    NSLog(@"Hooking +[VKImageAnalyzer deviceSupportsImageAnalysis]");
    dlopen("/System/Library/Frameworks/VisionKitCore.framework/VisionKitCore", RTLD_NOW);
    _ZKSwizzle(VKImageAnalyzer_LiveTextEnabler.class, NSClassFromString(@"VKImageAnalyzer"));
}


@end
