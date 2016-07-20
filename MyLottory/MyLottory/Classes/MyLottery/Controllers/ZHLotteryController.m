//
//  ZHLottery.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHLotteryController.h"
#import "ZHRootSettingController.h"

@interface ZHLotteryController ()

@end

@implementation ZHLotteryController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"客服" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"Mylottery_config"] style:UIBarButtonItemStyleDone target:self action:@selector(goToSettingVc)];
    self.navigationItem.title = @"我的彩票";
}

- (void)goToSettingVc{
    
    ZHRootSettingController *rootSetVc = [[ZHRootSettingController alloc] init];
    rootSetVc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:rootSetVc animated:YES];
    rootSetVc.plistName = @"ZHRootSetting";


}



@end
