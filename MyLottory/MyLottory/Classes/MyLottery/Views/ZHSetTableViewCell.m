//
//  ZHTableViewCell.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHSetTableViewCell.h"

@implementation ZHSetTableViewCell

+(instancetype)creatCellWith:(UITableView *)tableView andStyle:(UITableViewCellStyle)style{

    static NSString *ID = @"cell";
    ZHSetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZHSetTableViewCell alloc] initWithStyle:style reuseIdentifier:ID];
    }
    return cell;
}

-(void)setModel:(NSDictionary *)Model{
    
    _Model = Model;
    self.textLabel.text = Model[ZHTitle];
    if (Model[ZHImage] != nil) {
        self.imageView.image = [UIImage imageNamed:Model[ZHImage]];
    }
    Class className = NSClassFromString(Model[ZHAccessary]);
    id obj = [[className alloc] init];
    if ([obj isKindOfClass:[UIImageView class]]) {
        UIImageView *accessImg = (UIImageView *)obj;
        accessImg.image = [UIImage imageNamed:Model[ZHAccImgName]];
        [accessImg sizeToFit];
        self.accessoryView = accessImg;
    }else if ([obj isKindOfClass:[UISwitch class]]){
        UISwitch * accSwitch = (UISwitch *)obj;
        self.accessoryView = accSwitch;
    }
    if (Model[ZHSubTitle] != nil) {
        self.detailTextLabel.text = Model[ZHSubTitle];
    }
    
}



@end
