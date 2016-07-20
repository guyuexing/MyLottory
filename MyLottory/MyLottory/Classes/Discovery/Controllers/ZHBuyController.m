//
//  ZHBuyController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHBuyController.h"
#import "MyButton.h"
@interface ZHBuyController ()

@end

@implementation ZHBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    MyButton *button = [MyButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    [button setTitle:@"全部彩种" forState:UIControlStateNormal];
    [button sizeToFit];
    [button addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
}

-(void)BtnClick:(MyButton *)sender{
    
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    
    
    CGAffineTransform trans = CGAffineTransformIdentity;
    CGFloat height = 0;
    BOOL isTurn = CGAffineTransformIsIdentity(sender.imageView.transform);
    if (isTurn) {
        trans = CGAffineTransformRotate(sender.imageView.transform, M_PI);
        height = 200;
    }else{
        trans = CGAffineTransformIdentity;
        height = 0;
    }
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self.view);
        
    }];
    
    [UIView animateWithDuration:0.5 animations:^{
        sender.imageView.transform = trans;
        blueView.height = height;
        
    }];

}






@end
