//
//  ZHProductController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHProductController.h"
#import "ZHCollectionViewCell.h"


@interface ZHProductController ()

@property (nonatomic,strong) NSArray *appArr;

@end

@implementation ZHProductController

static NSString * ID = @"Cell";

#pragma mark - 纯代码创建collection控制器的时候，使用以下方法指定collection的流布局
- (instancetype)init{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(80, 80);
    flow.minimumInteritemSpacing = 5;
    flow.minimumLineSpacing = 20;
    flow.sectionInset = UIEdgeInsetsMake(20, 20, 0, 20);
    
    return [super initWithCollectionViewLayout:flow];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[ZHCollectionViewCell class] forCellWithReuseIdentifier:ID];
    self.navigationItem.title = @"产品推荐";
    
   }
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.appArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.modelDict = self.appArr[indexPath.row];
    return cell;
}


-(NSArray *)appArr{

    if (_appArr == nil) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"more_project.json" ofType:nil];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSArray *arr = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _appArr = arr;
    }
    return _appArr;
}

@end
