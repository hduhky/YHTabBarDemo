//
//  AppDelegate.m
//  YHTabBarController
//
//  Created by 黄珂耀 on 15/11/15.
//  Copyright © 2015年 黄珂耀. All rights reserved.
//

#import "AppDelegate.h"
#import "YHHomeViewController.h"
#import "YHMessageViewController.h"
#import "YHMineViewController.h"
#import "YHSameCityViewController.h"
#import "YHTabBar.h"
#import "YHTabBarItem.h"

@interface AppDelegate () <YHTabBarDelegate,UIActionSheetDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [NSThread sleepForTimeInterval:2.0];
    [_window makeKeyAndVisible];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    YHHomeViewController *homeViewController = [[YHHomeViewController alloc] init];
    YHSameCityViewController *sameCityViewController = [[YHSameCityViewController alloc] init];
    YHMessageViewController *messageViewController = [[YHMessageViewController alloc] init];
    YHMineViewController *mineViewController = [[YHMineViewController alloc] init];
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[homeViewController, sameCityViewController, messageViewController, mineViewController];
    
    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    YHTabBar *tabBar = [[YHTabBar alloc] initWithFrame:tabBarController.tabBar.bounds];
    
    CGFloat normalButtonWidth = (SCREEN_WIDTH * 3 / 4) / 4;
    CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
    CGFloat publishItemWidth = (SCREEN_WIDTH / 4);
    
    YHTabBarItem *homeItem = [self tabBarItemWithFrame:CGRectMake(0, 0, normalButtonWidth, tabBarHeight)
                                                 title:@"首页"
                                       normalImageName:@"home_normal"
                                     selectedImageName:@"home_highlight" tabBarItemType:YHTabBarItemNormal];
    YHTabBarItem *sameCityItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight)
                                                     title:@"同城"
                                           normalImageName:@"mycity_normal"
                                         selectedImageName:@"mycity_highlight" tabBarItemType:YHTabBarItemNormal];
    YHTabBarItem *publishItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, 0, publishItemWidth, tabBarHeight)
                                                    title:@"发布"
                                          normalImageName:@"post_normal"
                                        selectedImageName:@"post_normal" tabBarItemType:YHTabBarItemRise];
    YHTabBarItem *messageItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                                                    title:@"消息"
                                          normalImageName:@"message_normal"
                                        selectedImageName:@"message_highlight" tabBarItemType:YHTabBarItemNormal];
    YHTabBarItem *mineItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 3 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                                                 title:@"我的"
                                       normalImageName:@"account_normal"
                                     selectedImageName:@"account_highlight" tabBarItemType:YHTabBarItemNormal];
    
    tabBar.tabBarItems = @[homeItem, sameCityItem, publishItem, messageItem, mineItem];
    tabBar.delegate = self;
    
    [tabBarController.tabBar addSubview:tabBar];
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (YHTabBarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(YHTabBarItemType)tabBarItemType
{
    YHTabBarItem *item = [[YHTabBarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setImage:selectedImage forState:UIControlStateHighlighted];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    item.tabBarItemType = tabBarItemType;
    
    return item;
}

#pragma mark - YHTabBarDelegate

- (void)tabBarDidSelectedRiseButton
{
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UIViewController *viewController = tabBarController.selectedViewController;
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册选取", @"淘宝一键转卖", nil];
    [actionSheet showInView:viewController.view];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex {
    NSLog(@"buttonIndex = %ld", buttonIndex);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
