//
//  YHTabBar.h
//  YHTabBarController
//
//  Created by 黄珂耀 on 15/11/15.
//  Copyright © 2015年 黄珂耀. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YHTabBarDelegate;


@interface YHTabBar : UIView

@property (nonatomic,copy) NSArray *tabBarItems;

@property (nonatomic,weak) id <YHTabBarDelegate>delegate;

@end


@protocol YHTabBarDelegate <NSObject>

- (void)tabBarDidSelectedRiseButton;


@end
