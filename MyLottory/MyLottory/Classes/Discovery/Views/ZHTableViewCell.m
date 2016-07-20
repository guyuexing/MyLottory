//
//  ZHTableViewCell.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHTableViewCell.h"
#import "ZHDisModel.h"
@interface ZHTableViewCell ()

@property (nonatomic,weak) UIImageView *titleImg;
@property (nonatomic,weak) UIImageView *imgName;
@property (nonatomic,weak) UILabel *subTitle;

@end

@implementation ZHTableViewCell

+(instancetype)creatModelCell:(UITableView *)tableView{

    static NSString *ID = @"cell";
   ZHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZHTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *titleImg = [[UIImageView alloc] init];
        UIImageView *imgName = [[UIImageView alloc] init];
        UILabel *subTitle = [[UILabel alloc] init];
        [self.contentView addSubview:titleImg];
        [self.contentView addSubview:imgName];
        [self.contentView addSubview:subTitle];
        self.titleImg = titleImg;
        self.imgName = imgName;
        self.subTitle = subTitle;
    }

    return self;
}

- (void)setModel:(ZHDisModel *)model{

    _model = model;
    self.titleImg.image = [UIImage imageNamed:model.titleImg];
    self.imgName.image = [UIImage imageNamed:model.imageName];
    self.subTitle.text = model.subTitle;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.titleImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.mas_equalTo(self.contentView).offset(10);
    }];
    
    [self.imgName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.trailing.mas_equalTo(self.contentView).offset(-10);
        make.top.mas_equalTo(self.contentView).offset(10);
    }];
    
    [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.titleImg);
        make.baseline.mas_equalTo(self.imgName);
        
    }];
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
