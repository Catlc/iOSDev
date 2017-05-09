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
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav"] forBarMetrics:UIBarMetricsDefault];
    
//    self.navigationController.toolbarHidden = NO;

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
