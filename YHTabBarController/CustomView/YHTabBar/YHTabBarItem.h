//
//  YHTabBarItem.h
//  YHTabBarController
//
//  Created by 黄珂耀 on 15/11/15.
//  Copyright © 2015年 黄珂耀. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, YHTabBarItemType) {
    YHTabBarItemNormal = 0,
    YHTabBarItemRise,
};

@interface YHTabBarItem : UIButton

@property (nonatomic, assign) YHTabBarItemType tabBarItemType;

@end
