//
//  ZHHistoryController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHHistoryController.h"

@interface ZHHistoryController ()

@end

@implementation ZHHistoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"开奖信息";
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"开奖信息" forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"Historyawards_pushSettings"] forState:UIControlStateNormal];
    //MARK: - 必须要有button的大小信息才能显示button
    [button sizeToFit];
    button.adjustsImageWhenHighlighted = NO;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];

}





@end
