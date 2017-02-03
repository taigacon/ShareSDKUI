//
//  SSUIShareActionSheetStyle.m
//  ShareSDKUI
//
//  Created by 刘 靖煌 on 15/7/15.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import "SSUIShareActionSheetStyle.h"
#import "SSUIShareActionSheetStyle_Private.h"

@implementation SSUIShareActionSheetStyle

- (instancetype)init
{
    self = [super init];
    self.itemIcons = [[NSMutableDictionary alloc] init];
    return self;
}

+ (instancetype)sharedInstance
{
    static SSUIShareActionSheetStyle *style = nil;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        if (style == nil)
        {
            style = [[SSUIShareActionSheetStyle alloc] init];
        }
    });
    return style;
}

+ (void)setActionSheetColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].actionSheetColor = color;
}

+ (void)setActionSheetImage:(UIImage *)image
{
    [SSUIShareActionSheetStyle sharedInstance].actionSheetImage = image;
}

+ (void)setActionSheetBackgroundColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].actionSheetBackgroundColor = color;
}

+ (void)setItemNameColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].itemNameColor = color;
}

+ (void)setItemIcon:(UIImage *)image forPlatformType:(SSDKPlatformType)type
{
    NSMutableDictionary *itemIcons = (NSMutableDictionary *)[SSUIShareActionSheetStyle sharedInstance].itemIcons;
    [itemIcons setObject:image forKey:@(type)];
}

+ (void)setItemNameFont:(UIFont *)font
{
    [SSUIShareActionSheetStyle sharedInstance].itemNameFont = font;
}

+ (void)setCancelButtonLabelColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].cancelButtonLabelColor = color;
}

+ (void)setCancelButtonBackgroundColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].cancelButtonBackgroundColor = color;
}

+(void)setPageIndicatorTintColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].pageIndicatorTintColor = color;
}

+(void)setCurrentPageIndicatorTintColor:(UIColor *)color
{
    [SSUIShareActionSheetStyle sharedInstance].currentPageIndicatorTintColor = color;
}

+(void)setSupportedInterfaceOrientation:(UIInterfaceOrientationMask)toInterfaceOrientation
{
    [SSUIShareActionSheetStyle sharedInstance].supportedInterfaceOrientation = toInterfaceOrientation;
}

+ (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle
{
    [SSUIShareActionSheetStyle sharedInstance].statusBarStyle = statusBarStyle;
}

+ (void)isCancelButtomHidden:(BOOL)isCancelButtomHidden
{
    [SSUIShareActionSheetStyle sharedInstance].isCancelButtomHidden = isCancelButtomHidden;
}

@end
