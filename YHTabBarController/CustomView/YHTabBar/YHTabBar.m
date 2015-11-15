//
//  YHTabBar.m
//  YHTabBarController
//
//  Created by 黄珂耀 on 15/11/15.
//  Copyright © 2015年 黄珂耀. All rights reserved.
//

#import "YHTabBar.h"
#import "YHTabBarItem.h"

@implementation YHTabBar

#pragma mark - Life Cycle

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self config];
    }
    return self;
}

#pragma mark - Private Method

- (void)config
{
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_WIDTH, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
}

- (void)setSelectedIndex:(NSInteger)index
{
    for (YHTabBarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.selected = YES;
        } else {
            item.selected = NO;
        }
    }
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    UITabBarController *tabBarController = (UITabBarController *)keyWindow.rootViewController;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }

}

#pragma mark - Touch Event

- (void)itemSelected:(YHTabBarItem *)sender {
    if (sender.tabBarItemType != YHTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

#pragma mark - Setter

- (void)setTabBarItems:(NSArray *)tabBarItems {
    _tabBarItems = tabBarItems;
    NSInteger itemTag = 0;
    for (id item in tabBarItems) {
        if ([item isKindOfClass:[YHTabBarItem class]]) {
            if (itemTag == 0) {
                ((YHTabBarItem *)item).selected = YES;
            }
            [((YHTabBarItem *)item) addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:item];
            if (((YHTabBarItem *)item).tabBarItemType != YHTabBarItemRise) {
                ((YHTabBarItem *)item).tag = itemTag;
                itemTag++;
            }
        }
    }
}



@end
