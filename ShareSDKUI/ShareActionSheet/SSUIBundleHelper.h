//
//  SSUIBundleHelper.h
//  ShareSDKUI
//
//  Created by taigacon on 2017/2/3.
//  Copyright © 2017年 mob. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ShareSDK/SSDKTypeDefine.h>

@interface SSUIBundleHelper : NSObject

+(NSBundle *) uiBundle;

+(UIImage *) itemIconWithPlatformType:(SSDKPlatformType)platformType;

+(NSString *) labelWithPlatformType:(SSDKPlatformType)platformType;

@end
