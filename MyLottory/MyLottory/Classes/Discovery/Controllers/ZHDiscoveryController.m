//
//  ZHDiscoveryController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHDiscoveryController.h"
#import "ZHDisModel.h"
#import "ZHTableViewCell.h"
#import "ZHBuyController.h"
#import "ZHLuckController.h"

@interface ZHDiscoveryController ()

@property (nonatomic,strong) NSArray *disArr;

@end

@implementation ZHDiscoveryController

#pragma mark - 初始化设置TableView的样式
- (instancetype)initWithStyle:(UITableViewStyle)style{
    
    return [super initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    self.tableView.rowHeight = 100;
    
}

#pragma mark - 选中cell进行跳转
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        ZHBuyController *buyVc = [[ZHBuyController alloc] init];
        //MARK: - 控制器push进导航控制器的时候隐藏底部的tabbar
        buyVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:buyVc animated:YES];
    }else if (indexPath.section == 2){
        ZHLuckController *luckVc = [[ZHLuckController alloc] init];
        luckVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:luckVc animated:YES];
    }
}



#pragma mark - 数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.disArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ZHTableViewCell *cell = [ZHTableViewCell creatModelCell:tableView];
    cell.model = self.disArr[indexPath.section];
    return cell;

}


-(NSArray *)disArr{

    if (_disArr == nil) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"ZHDiscovery.plist" ofType:nil]];
        NSMutableArray *arrM = [NSMutableArray arrayWithCapacity:arr.count];
        [arr enumerateObjectsUsingBlock:^(NSDictionary * obj, NSUInteger idx, BOOL * _Nonnull stop) {
            ZHDisModel *model = [ZHDisModel modelWithDict:obj];
            [arrM addObject:model];
        }];
        _disArr = arrM;
    }
    return _disArr;
}


@end
