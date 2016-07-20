//
//  ZHTableViewCell.h
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZHHeader @"ZHHeader"
#define ZHFooter @"ZHFooter"
#define ZHItems @"ZHItems"
#define ZHImage @"ZHImage"
#define ZHTitle @"ZHTitle"
#define ZHAccessary @"ZHAccessary"
#define ZHAccImgName @"ZHAccImgName"
#define ZHTargetVC @"ZHTargetVC"
#define ZHPlistName @"ZHPlistName"
#define ZHStyle @"ZHStyle"
#define ZHSubTitle @"ZHSubTitle"

@interface ZHSetTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary *Model;

+(instancetype)creatCellWith:(UITableView *)tableView andStyle:(UITableViewCellStyle)style;

@end
