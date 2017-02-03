//
//  SSUIShareActinoSheetItemView.m
//  ShareSDKUI
//
//  Created by 刘 靖煌 on 15/7/15.
//  Copyright (c) 2015年 mob. All rights reserved.
//

#import "SSUIShareActinoSheetItemView.h"
#import "SSUIShareActionSheetItem.h"
#import "SSUIShareActionSheetPlatformItem.h"
#import "SSUIShareActionSheetCustomItem.h"
#import "SSUIShareActionSheetStyle_Private.h"
#import <MOBFoundation/MOBFDevice.h>

static const CGFloat iconH = 60.0;
static const CGFloat nameH = 18;
static const CGFloat iconPercentage = 0.35;

@interface SSUIShareActinoSheetItemView ()

@property (nonatomic ,strong) SSUIShareActionSheetItem *baseItem;

@end

@implementation SSUIShareActinoSheetItemView

-(instancetype)initWithIndex:(NSInteger)index itemW:(CGFloat)itemWidth itemH:(CGFloat)itemHeight
{
    if (self = [super initWithFrame:CGRectMake(0, 0, itemWidth, itemHeight)])
    {
        self.index = index;
        self.backgroundColor = [UIColor whiteColor];
        self.userInteractionEnabled = YES;
        self.platformIcon.userInteractionEnabled = YES;
        
        UILabel *name = [[UILabel alloc] init];
        name.textAlignment = NSTextAlignmentCenter;
        name.textColor = [UIColor blackColor];
        name.backgroundColor = [UIColor clearColor];
        name.font = [UIFont systemFontOfSize:12];
        //iOS10以上中文大小比iOS以下大,因此字体略缩小
        if ([MOBFDevice versionCompare:@"10.0"] >= 0)
        {
            name.font = [UIFont systemFontOfSize:11.5];
        }
        _itemW = 60;

        if ([SSUIShareActionSheetStyle sharedInstance].itemNameColor)
        {
            name.textColor = [SSUIShareActionSheetStyle sharedInstance].itemNameColor;
        }
        
        if ([SSUIShareActionSheetStyle sharedInstance].itemNameFont)
        {
            name.font = [SSUIShareActionSheetStyle sharedInstance].itemNameFont;
        }
        
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:name];
        self.nameLabel = name;

        UIImageView *icon = [[UIImageView alloc] init];

        [self addTarget:self action:@selector(itemClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:icon];
        self.platformIcon = icon;
    }
    return self;
}

-(void)setItem:(SSUIShareActionSheetItem *)item
{
    _item = item;
    self.platformIcon.image = item.icon;
    self.nameLabel.text = item.label;
}

- (void)itemClicked:(id)sender
{
    if (self.clickHandle)
    {
        self.clickHandle(self.index,self.item);
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.platformIcon.frame = CGRectMake(0, 0, _itemW, iconH);
    CGFloat nameY = CGRectGetMaxY(self.platformIcon.frame);
    self.nameLabel.frame = CGRectMake(0, nameY, _itemW, nameH);
}

@end
