//
//  TabBarControllerConfig.m
//  iOSDev
//
//  Created by 李承 on 2017/5/11.
//  Copyright © 2017年 李承. All rights reserved.
//

#import "TabBarControllerConfig.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "OtherViewController.h"


@interface BaseNavigationController : UINavigationController
@end

@implementation BaseNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

@end

@interface TabBarControllerConfig ()


@property (nonatomic, readwrite, strong) CYLTabBarController *tabBarController;

@end


@implementation TabBarControllerConfig

/**
 *  lazy load tabBarController
 *
 *  @return CYLTabBarController
 */
- (CYLTabBarController *)tabBarController {
    if (_tabBarController == nil) {
         CYLTabBarController *tabBarController = [CYLTabBarController tabBarControllerWithViewControllers:self.viewControllers
                                                                                   tabBarItemsAttributes:self.tabBarItemsAttributesForController];
         [self customizeTabBarAppearance:tabBarController];
    
        _tabBarController = tabBarController;
    }
    return _tabBarController;
}


- (NSArray *)tabBarItemsAttributesForController {
    
    NSDictionary *dict1 = @{
                                                        CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"home_normal",
                            CYLTabBarItemSelectedImage : @"home_highlight",
                            };
    NSDictionary *dict2 = @{
                                                        CYLTabBarItemTitle : @"消息",
                            CYLTabBarItemImage : @"message_normal",
                            CYLTabBarItemSelectedImage : @"message_highlight",
                            };
    NSDictionary *dict3 = @{
                                                        CYLTabBarItemTitle : @"其他",
                            CYLTabBarItemImage : @"mycity_normal",
                            CYLTabBarItemSelectedImage : @"mycity_highlight",
                            };
    NSDictionary *dict4 = @{
                                                        CYLTabBarItemTitle : @"我",
                            CYLTabBarItemImage : @"account_normal",
                            CYLTabBarItemSelectedImage : @"account_highlight",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3 , dict4];
    
    return tabBarItemsAttributes;
 }

- (NSArray *)viewControllers {
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    UIViewController *homeNavigationController = [[UINavigationController alloc]
                                                  initWithRootViewController:homeViewController];
    
    
    MessageViewController *messageViewController = [[MessageViewController alloc] init];
    UIViewController *messageNavigationController = [[UINavigationController alloc]
                                                     initWithRootViewController:messageViewController];
    
    OtherViewController *otherViewController = [[OtherViewController alloc] init];
    UIViewController *otherNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:otherViewController];
    
    MineViewController *mineViewController = [[MineViewController alloc] init];
    UIViewController *mineNavigationController = [[UINavigationController alloc]
                                                  initWithRootViewController:mineViewController];
    
    
    
    NSArray *viewControllers = @[
                                 homeNavigationController,
                                 messageNavigationController,
                                 otherNavigationController,
                                 mineNavigationController
                                 ];
    
    return viewControllers;
    
}
/**
 *  tabBarItem 的选中和不选中文字属性、背景图片
 */
- (void)customizeTabBarAppearance:(CYLTabBarController *)tabBarController {
    
//    tabBarController.tabBarHeight = 40.f;

    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor colorWithRed:0.98 green:0.85 blue:0.38 alpha:1.00];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    // 设置背景图片
    UITabBar *tabBarAppearance = [UITabBar appearance];
    [tabBarAppearance setBackgroundImage:[UIImage imageNamed:@""]];
}




@end
