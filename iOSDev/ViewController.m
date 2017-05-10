//
//  ViewController.m
//  iOSDev
//
//  Created by 李承 on 2017/5/9.
//  Copyright © 2017年 李承. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.title = @"首页";  title 会设置下边的tabBarItem的title
    
    self.navigationItem.title = @"首页";
    
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
    //半透明开关
    self.navigationController.navigationBar.translucent = NO;

    
    //设置移除黑线
//    self.navigationController.navigationBar.clipsToBounds = YES;
        [self useMethodToFindBlackLineAndHind];
    
    
    //    self.navigationController.toolbarHidden = NO;
    //    self.navigationController.navigationBarHidden = YES;
    
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
    
    [self setStatusBarBackgroundColor:[UIColor redColor]];
    [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleLightContent;
}
 
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
