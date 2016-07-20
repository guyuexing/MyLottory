//
//  ZHArenaController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHArenaController.h"
#import "ZHNavigationController.h"
@interface ZHArenaController ()

@end

@implementation ZHArenaController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //MARK: - 通过layer设置竞技场背景图片
    self.view.layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"NLArenaBackground"].CGImage);
    
    //MARK: - 给导航栏设置背景图片，注意先要将控制器添加到导航控制器
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"NLArenaNavBar64"] forBarMetrics:UIBarMetricsDefault];
    
    //MARK: - 创建segment并设置相关信息
    UISegmentedControl *segment = [[UISegmentedControl alloc] init];
    [segment insertSegmentWithTitle:@"足球" atIndex:0 animated:YES];
    [segment insertSegmentWithTitle:@"篮球" atIndex:1 animated:YES];
    [segment sizeToFit];
    segment.width = 150;
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
//    [segment setTintColor:[UIColor whiteColor]];
    [segment setTitleTextAttributes:@{
                NSForegroundColorAttributeName:[UIColor whiteColor]
                                      } forState:UIControlStateNormal];
    [segment setTitleTextAttributes:@{
                NSForegroundColorAttributeName:[UIColor whiteColor]
                                      } forState:UIControlStateSelected];
    self.navigationItem.titleView = segment;
    

}



@end
