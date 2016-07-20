//
//  ZHHallController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHHallController.h"


@interface ZHHallController ()

@property (nonatomic,weak) UIView *backView;

@property (nonatomic,weak) UIImageView *adView;

@end

@implementation ZHHallController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationItem.title = @"购彩大厅";
    
    UIButton *leftBtn = [[UIButton alloc] init];
    [leftBtn setImage:[UIImage imageNamed:@"CS50_activity_image"] forState:UIControlStateNormal];
    [leftBtn sizeToFit];
    leftBtn.adjustsImageWhenHighlighted = NO;
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
    [leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
   
}

- (void)leftBtnClick{

    UIView *backView = [[UIView alloc] init];
    backView.x = 0;
    backView.y = 0;
    backView.width = self.view.width;
    backView.height = self.view.height;
    backView.alpha = 0.3;
    backView.backgroundColor = [UIColor blackColor];
    self.backView = backView;
    [self.view addSubview:backView];
//    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leadingMargin.trailingMargin.equalTo(self.view).offset(0);
//        make.topMargin.equalTo(self.view).offset(0);
//    }];
    UIImageView *adView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"showActivity"]];
    [self.view addSubview:adView];
    [adView sizeToFit];
    adView.center = self.backView.center;
    adView.userInteractionEnabled = YES;
    self.adView = adView;
    
    ZHButton *adClose = [ZHButton buttonWithType:UIButtonTypeCustom];
    [adView addSubview:adClose];
    [adClose setImage:[UIImage imageNamed:@"alphaClose"] forState:UIControlStateNormal];
    [adClose sizeToFit];
    adClose.x = adView.width - adClose.width;
    adClose.y = 0;
    [adClose addTarget:self action:@selector(adCloseBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

-(void)adCloseBtnClick{

[UIView animateWithDuration:0.5 animations:^{
    self.adView.alpha = 0;
    self.backView.alpha = 0;
} completion:^(BOOL finished) {
    [self.adView removeFromSuperview];
    [self.backView removeFromSuperview];
}];

}

@end
