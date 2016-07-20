//
//  ZHCollectionViewCell.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHCollectionViewCell.h"

@interface ZHCollectionViewCell ()

@property (nonatomic,weak) UIImageView *appImg;
@property (nonatomic,weak) UILabel *appName;

@end

@implementation ZHCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *appImg = [[UIImageView alloc] init];
        self.appImg = appImg;
        [self.contentView addSubview:appImg];
        
        UILabel *appName = [[UILabel alloc] init];
        self.appName = appName;
        [self.contentView addSubview:appName];
    }
    return self;
}

- (void)setModelDict:(NSDictionary *)modelDict{
    _modelDict = modelDict;
    self.appImg.image = [UIImage imageNamed:modelDict[@"icon"]];
    self.appName.text = modelDict[@"title"];
    [self.appName setFont:[UIFont systemFontOfSize:13.0]];
    [self.appName setTextAlignment:NSTextAlignmentCenter];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.appImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.centerX.mas_equalTo(self.contentView);
        make.width.height.mas_equalTo(57);
    }];
    [self.appName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.contentView);
        make.baseline.mas_equalTo(self.contentView.mas_bottom);
    }];
}

@end
