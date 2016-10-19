//
//  NavtestViewController.m
//  HAKit
//
//  Created by 🐷 on 16/10/14.
//  Copyright © 2016年 🐷. All rights reserved.
//


/*
  
    iOS 仿知乎/途家导航栏渐变文字动画效果
 
    1.导航栏一开始是隐藏的,随着scrollView滚动而渐变
    2.导航栏左右两边的navigationItem是一直显示的
    3.导航栏参考了途家app,使用了毛玻璃效果,背景是一张图片
    4.下拉放大图片效果
    5.title文字动画效果
 
    通过简单分析,系统的导航栏实现以上效果有点困难,直接自定义一个假的导航栏更容易点
 
 */

#import "NavtestViewController.h"

@interface NavtestViewController ()

@end

@implementation NavtestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
