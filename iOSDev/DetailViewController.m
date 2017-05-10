//
//  DetailViewController.m
//  iOSDev
//
//  Created by 李承 on 2017/5/9.
//  Copyright © 2017年 李承. All rights reserved.
//

#import "DetailViewController.h"
#import "ModuleViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    
    //默认背景色上传到简书不理想，所以换一种背景色
    self.view.backgroundColor = [UIColor greenColor];
    
    //*****************navigationItem*********************************
    //navigationItem控制导航栏标题(title)、promt、标题视图(titleView)、以及按钮（barButtonItem）的添加和数量
    
    self.navigationItem.title = @"刘大帅";
    
    //我表示我不喜欢promt...
    //    self.navigationItem.prompt = @"promt";
    
    //修改导航栏标题为图片
    self.navigationItem.titleView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"m_hot60"]];
    
    //添加多个按钮
    UIBarButtonItem* item1 = [[UIBarButtonItem alloc]initWithTitle:@"item1" style:UIBarButtonItemStylePlain target:nil action:nil];
    UIBarButtonItem* item2 = [[UIBarButtonItem alloc]initWithTitle:@"item2" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    NSArray* array = @[item1,item2];
    
//    self.navigationItem.leftBarButtonItems = array;
    
    self.navigationItem.rightBarButtonItems = array;
    
    
    
    
    //*****************navigationBar**********************************
    //navigationBar控制导航栏背景色（barTintColor）、背景图片（backgroundImage）、按钮字体颜色（tintColor），标题文本属性(titleTextAttributes)
    
    //调整导航栏背景色
    self.navigationController.navigationBar.barTintColor = [UIColor orangeColor];
    
    //半透明开关
    self.navigationController.navigationBar.translucent = NO;
    
    //为导航栏添加背景图片，图片如果是44高，那么不覆盖状态栏，如果是64高就会覆盖状态栏
    //UIBarMetricsDefault 缺省值 UIBarMetricsCompact 横屏样式  UIBarMetricsDefaultPrompt和UIBarMetricsCompactPrompt是有promt的两种样式
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"m_nav64"] forBarMetrics:UIBarMetricsDefault];
    
    //
    self.navigationController.navigationBar.tintColor = [UIColor purpleColor];
    
    //定制返回按钮,这两个要一起用,为啥这么用，苹果言语不详
//    self.navigationController.navigationBar.backIndicatorImage = [UIImage imageNamed:@"m_ios"];
//    self.navigationController.navigationBar.backIndicatorTransitionMaskImage = [UIImage imageNamed:@"m_ios"];
    
    //修改导航栏标题的字体
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    //字典中放入你想修改的键值对,原来的UITextAttributeFont、UITextAttributeTextColor、UITextAttributeTextShadowColor、UITextAttributeTextShadowOffset已弃用
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0],
                                                                    NSShadowAttributeName:shadow,
                                                                    NSFontAttributeName:[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0]
                                                                    };
    
    //导航栏toolBar隐藏开关
//    self.navigationController.toolbarHidden = NO;
}

-(void)push{
    ModuleViewController *module = [ModuleViewController new];
    [self.navigationController pushViewController:module animated:YES];
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
