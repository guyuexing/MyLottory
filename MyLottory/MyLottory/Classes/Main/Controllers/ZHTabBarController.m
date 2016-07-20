//
//  ZHTabBarController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHTabBarController.h"
#import "ZHNavigationController.h"
#import "ZHHallController.h"
#import "ZHArenaController.h"
#import "ZHDiscoveryController.h"
#import "ZHHistoryController.h"
#import "ZHLotteryController.h"
#import "ZHButton.h"

@interface ZHTabBarController ()

@property (nonatomic,weak) UIView *tabView;

@property (nonatomic,weak) ZHButton *selBtn;
@end

@implementation ZHTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self setChildController];
    
    UIView *tabView = [[UIView alloc] init];
    tabView.backgroundColor = [UIColor blackColor];
    
    tabView.x = 0;
    tabView.y = 0;
    [self.tabBar addSubview:tabView];
    tabView.width = self.tabBar.width;
    tabView.height = self.tabBar.height;
    
//    self.tabBar是只读的，不能对它添加约束，修改其属性
//        [tabView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.leading.trailing.equalTo(self.tabBar);
//            make.topMargin.bottomMargin.mas_equalTo(self.tabBar).offset(0);
//        }];
    
    self.tabView = tabView;

    [self setupBtn];

    
}

- (void)setupBtn{
    
        //为什么将以上代码放在viewDidLoad中，tabView在tabBar下面？

    [self.childViewControllers enumerateObjectsUsingBlock:^(__kindof UINavigationController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ZHButton *tabBtn = [ZHButton buttonWithType:UIButtonTypeCustom];
        NSString *norImgName = [NSString stringWithFormat:@"TabBar%zd",idx+1];
        NSString *selImgName = [NSString stringWithFormat:@"TabBar%zdSel",idx+1];
        [tabBtn setImage:[UIImage imageNamed:norImgName] forState:UIControlStateNormal];
        [tabBtn setImage:[UIImage imageNamed:selImgName] forState:UIControlStateSelected];
        tabBtn.width = self.tabView.width/self.childViewControllers.count;
       tabBtn.height = self.tabView.height;
        tabBtn.x = tabBtn.width * idx;
        tabBtn.y = 0;
        tabBtn.tag = idx;
        [self.tabView addSubview:tabBtn];
        [tabBtn addTarget:self action:@selector(tabBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        if (idx == 4) {
            [self tabBtnClick:tabBtn];
        }
        //MARK: - 设置导航控制器的根控制器的背景颜色
        obj.viewControllers.lastObject.view.backgroundColor = ZHRandomColor;
    }];

}

- (void)tabBtnClick:(ZHButton *)sender{
    self.selBtn.selected = NO;
    sender.selected = YES;
    self.selectedIndex = sender.tag;
    self.selBtn = sender;
}

- (void)setChildController{
    
//    ZHLotteryController *myLotteryVc = ;
//    myLotteryVc.view.backgroundColor = ZHRandomColor;
    ZHNavigationController *naviLotVc = [[ZHNavigationController alloc] initWithRootViewController:[[ZHLotteryController alloc] init]];
    
#warning 如果在控制器创建之后再加入到导航控制器，会导致在控制器中的self.navigationController为空，也就无法再设置导航栏了
//    ZHArenaController *arenVc = [[ZHArenaController alloc] init];
//    arenVc.view.backgroundColor = ZHRandomColor;
    ZHNavigationController *naviAreVc = [[ZHNavigationController alloc] initWithRootViewController:[[ZHArenaController alloc] init]];
    
//    ZHDiscoveryController *disVc = ;
//    disVc.view.backgroundColor = ZHRandomColor;
    ZHNavigationController *naviDisVc = [[ZHNavigationController alloc] initWithRootViewController:[[ZHDiscoveryController alloc] init]];
    
//    ZHHistoryController *hisVc = ;
//    hisVc.view.backgroundColor = ZHRandomColor;
    ZHNavigationController *naviHisVc = [[ZHNavigationController alloc] initWithRootViewController:[[ZHHistoryController alloc] init]];
    
//    ZHHallController *hallVc = ;
//    hallVc.view.backgroundColor = ZHRandomColor;
    ZHNavigationController *naviHallVc = [[ZHNavigationController alloc] initWithRootViewController:[[ZHHallController alloc] init]];
    
    self.viewControllers = @[naviHallVc,naviAreVc,naviDisVc,naviHisVc,naviLotVc];
//    self addChildViewController:<#(nonnull UIViewController *)#>

}


@end
