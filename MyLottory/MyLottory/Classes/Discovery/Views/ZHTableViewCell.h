//
//  ZHTableViewCell.h
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHDisModel;

@interface ZHTableViewCell : UITableViewCell

@property (nonatomic,strong) ZHDisModel *model;

+ (instancetype)creatModelCell:(UITableView *)tableView;

@end
