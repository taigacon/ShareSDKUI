//
//  SSUIShareActionSheetPlatformItem.m
//  ShareSDKUI
//
//  Created by 刘 靖煌 on 15/6/18.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import "SSUIShareActionSheetPlatformItem.h"
#import <MOBFoundation/MOBFImage.h>
#import "SSUIShareActionSheetStyle_Private.h"
#import "SSUIBundleHelper.h"

@interface SSUIShareActionSheetPlatformItem ()

@end

@implementation SSUIShareActionSheetPlatformItem

- (instancetype)initWithPlatformType:(SSDKPlatformType)platformType
{
    if (self = [super init])
    {
        _platformType = platformType;
        
        _icon = [SSUIShareActionSheetPlatformItem itemIconForPlatformType:platformType];
        
        _label = [SSUIBundleHelper labelWithPlatformType:platformType];
    }
    return self;
}

+ (UIImage *)itemIconForPlatformType:(SSDKPlatformType)platformType
{
    NSDictionary *itemIcons = [SSUIShareActionSheetStyle sharedInstance].itemIcons;
    UIImage *image = [itemIcons objectForKey:@(platformType)];
    if(image)
    {
        return image;
    }
    
    return [SSUIBundleHelper itemIconWithPlatformType:platformType];
}

- (NSString *)label
{
    return _label;
}

- (UIImage *)icon
{
    return _icon;
}

@end
