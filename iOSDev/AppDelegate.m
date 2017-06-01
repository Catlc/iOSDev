//
//  AppDelegate.m
//  iOSDev
//
//  Created by 李承 on 2017/5/9.
//  Copyright © 2017年 李承. All rights reserved.
//

#import "AppDelegate.h"
#import "IIViewDeckController.h"
#import "ModuleViewController.h"
#import "TabBarControllerConfig.h"
#import "SideViewController.h"



@interface AppDelegate ()<UITabBarDelegate>


@property(nonatomic,strong)  CYLTabBarController *tabBarController;
@property (nonatomic,strong) IIViewDeckController *viewDeckController;


@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
     self.window.backgroundColor = [UIColor whiteColor];
    
    [UINavigationBar appearance].tintColor = [UIColor orangeColor];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
 
    TabBarControllerConfig *tabBarControllerConfig = [[TabBarControllerConfig alloc] init];
    SideViewController *sideVc  = [[SideViewController alloc]initWithStyle:UITableViewStyleGrouped];
    UINavigationController *sideNavigationController = [[UINavigationController alloc] initWithRootViewController:sideVc];
    
    IIViewDeckController *viewDeckController = [[IIViewDeckController alloc] initWithCenterViewController:tabBarControllerConfig.tabBarController leftViewController:sideNavigationController];
    
    self.viewDeckController = viewDeckController;
    [self.window setRootViewController:self.viewDeckController];
    
    NSLog(@"测试2017-5-31");
    NSLog(@"MacBook Air licheng 2017-6-1");
    NSLog(@"测试2017-6-1");

    
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
