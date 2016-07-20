//
//  ZHRootSettingController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHRootSettingController.h"
#import "ZHSetTableViewCell.h"
#import "ZHProductController.h"
#import "ZHAboutController.h"


@interface ZHRootSettingController ()

@property (nonatomic,strong) NSArray<NSDictionary *> *setArr;

@end

@implementation ZHRootSettingController

- (instancetype)initWithStyle:(UITableViewStyle)style{

    return [super initWithStyle:UITableViewStyleGrouped];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style: UIBarButtonItemStylePlain target:nil action:nil];

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dict = self.setArr[indexPath.section];
    NSArray *modelArr = dict[ZHItems];
    NSString *targetVc = modelArr[indexPath.row][ZHTargetVC];
    
    if ([targetVc isEqualToString:@"UIAlertController"]) {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"提示" message:@"已经是最新版本" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alertC addAction:confirm];
        [self presentViewController:alertC animated:YES completion:nil];
        return;
    }
    Class className = NSClassFromString(targetVc);
    id obj = [[className alloc] init];
    if ([obj isKindOfClass:[ZHRootSettingController class]]){
        ZHRootSettingController *pushVc = (ZHRootSettingController *)obj;
        pushVc.plistName = modelArr[indexPath.row][ZHPlistName];
        [self.navigationController pushViewController:pushVc animated:YES];
    }else if ([obj isKindOfClass:[ZHProductController class]]){
        ZHProductController *proVc = [[ZHProductController alloc] init];
        proVc.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:proVc animated:YES];
  
    }else if([obj isKindOfClass:[UIViewController class]]) {
            UIViewController *converVc = [[UIViewController alloc] init];
            converVc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:converVc animated:YES];
            converVc.navigationItem.title = @"使用兑换码";
            converVc.view.backgroundColor = ZHRandomColor;
        
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return self.setArr[section][ZHHeader];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.setArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSDictionary *items = self.setArr[section];
    return [items[ZHItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dict = self.setArr[indexPath.section];
    NSArray *modelArr = dict[ZHItems];
    
    UITableViewCellStyle style = UITableViewCellStyleDefault;
    if ([(modelArr[indexPath.row][ZHStyle]) isEqualToString:@"UITableViewCellStyleValue1"]) {
        style = UITableViewCellStyleValue1;
    }else if ([(modelArr[indexPath.row][ZHStyle]) isEqualToString:@"UITableViewCellStyleSubtitle"]){
        style = UITableViewCellStyleSubtitle;
    }
    ZHSetTableViewCell *cell = [ZHSetTableViewCell creatCellWith:tableView andStyle:style];
   
    cell.Model = modelArr[indexPath.row];
    return cell;

}

-(NSArray *)setArr{

    if (_setArr == nil) {
        NSArray *arr = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:self.plistName ofType:@"plist"]];
        _setArr = arr;
    }
    return _setArr;
}
@end
