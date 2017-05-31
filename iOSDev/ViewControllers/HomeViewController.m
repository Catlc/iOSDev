//
//  HomeViewController.m
//  iOSDev
//
//  Created by 李承 on 2017/5/11.
//  Copyright © 2017年 李承. All rights reserved.
//

#import "HomeViewController.h"
#import "DetailViewController.h"
#import <ViewDeck/ViewDeck.h>


@interface HomeViewController ()

/** 上次选中的索引(或者控制器) */
@property (nonatomic, assign) NSInteger lastSelectedIndex;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //    self.title = @"首页";  title 会设置下边的tabBarItem的title
    
    self.navigationItem.title = @"首页";
    
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav"] forBarMetrics:UIBarMetricsDefault];
    //半透明开关
    self.navigationController.navigationBar.translucent = NO;

    
    //设置移除黑线
    //    self.navigationController.navigationBar.clipsToBounds = YES;
    [self useMethodToFindBlackLineAndHind];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"item" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"menu" style:UIBarButtonItemStylePlain target:self action:@selector(menu)];
    
    
    static NSString *tabBarDidSelectedNotification = @"tabBarDidSelectedNotification";
    //注册接收通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarSeleted) name:tabBarDidSelectedNotification object:nil];
}
-(void)tabBarSeleted
{
    
    //直接写刷新代码
    NSLog(@"刷新中。。。。。");
   
}


/**
 显示抽屉菜单方法
 */
-(void)menu{
    [self.viewDeckController openSide:IIViewDeckSideLeft animated:YES];

}
-(void)push{
    
    DetailViewController *vc = [DetailViewController new];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)useMethodToFindBlackLineAndHind
{
    UIImageView* blackLineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    //隐藏黑线（在viewWillAppear时隐藏，在viewWillDisappear时显示）
    blackLineImageView.hidden = YES;
}
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0)
    {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

//设置状态栏颜色
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
-(void)viewWillAppear:(BOOL)animated{
    
//    [self setStatusBarBackgroundColor:[UIColor redColor]];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
