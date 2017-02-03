//
//  SSUIBundleHelper.m
//  ShareSDKUI
//
//  Created by taigacon on 2017/2/3.
//  Copyright © 2017年 mob. All rights reserved.
//

#import "SSUIBundleHelper.h"
#import <MOBFoundation/MOBFoundation.h>

static NSBundle *uiBundle = nil;

@implementation SSUIBundleHelper



+(NSBundle *) uiBundle
{
    if (!uiBundle)
    {
        NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"ShareSDKUI"
                                                               ofType:@"bundle"];
        uiBundle = [NSBundle bundleWithPath:bundlePath];
    }
    return uiBundle;
}

+(UIImage *) itemIconWithPlatformType:(SSDKPlatformType)platformType
{
    return [MOBFImage imageName:[NSString stringWithFormat:@"Icon/sns_icon_%zi.png",platformType] bundle:[SSUIBundleHelper uiBundle]];
}

+(NSString *) labelWithPlatformType:(SSDKPlatformType)platformType
{
    NSString *temName = [NSString stringWithFormat:@"ShareType_%zi",platformType];
    return NSLocalizedStringWithDefaultValue(temName, @"ShareSDKUI_Localizable", [SSUIBundleHelper uiBundle], temName, nil);
}


@end
