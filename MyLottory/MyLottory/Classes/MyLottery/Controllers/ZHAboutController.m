//
//  ZHAboutController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHAboutController.h"

@interface ZHAboutController ()
@property (nonatomic,weak) UIView *headView;
@end

@implementation ZHAboutController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor blueColor];
//    headerView.frame = CGRectMake(0, 0, 0, 400);
//    [self.tableView addSubview:headerView];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"about_logo"]];
//    [imgView sizeToFit];
    [headerView addSubview:imgView];
    self.tableView.tableHeaderView = headerView;
    self.headView = headerView;
    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.mas_equalTo(self.tableView);
        make.height.offset(200);
    }];
    
}

//使用此方法给TableViewheader设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200;

}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
        [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.mas_equalTo(self.tableView);
    
            make.height.offset(200);
        }];
}




@end
