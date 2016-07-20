//
//  ZHNavigationController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHNavigationController.h"

@implementation ZHNavigationController

+(void)initialize{
    
    UINavigationBar *naviBar = [UINavigationBar appearance];
    [naviBar setTitleTextAttributes:@{
                                                  
    NSForegroundColorAttributeName:[UIColor whiteColor]
                                                  
                                    }];
    [naviBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
    [naviBar setTintColor:[UIColor whiteColor]];
    
}

#pragma mark - 纯代码使用此方法对导航控制器进行隐藏
//- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
//    
//    
//    viewController.hidesBottomBarWhenPushed = YES;
//    [super pushViewController:viewController animated:animated];
//}

@end
