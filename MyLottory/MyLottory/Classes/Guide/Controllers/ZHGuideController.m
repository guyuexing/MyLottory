//
//  ZHGuideController.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHGuideController.h"
#import "ZHGuideViewCell.h"

@interface ZHGuideController ()

@property (nonatomic,strong) NSArray *picArr;

@property (nonatomic,weak) UIImageView *guideImg;

@property (nonatomic,weak) UIImageView *largeText;

@property (nonatomic,weak) UIImageView *smallText;

@end

@implementation ZHGuideController

static NSString * const reuseIdentifier = @"Cell";

-(instancetype)init{
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = [UIScreen mainScreen].bounds.size;
    flow.minimumLineSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return [super initWithCollectionViewLayout:flow];
}

static NSString *ID = @"cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    [self.collectionView registerClass:[ZHGuideViewCell class] forCellWithReuseIdentifier:ID];
    [self setUpUI];
}

- (void)setUpUI{
    
    UIImageView *guideImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    [self.collectionView addSubview:guideImg];
    self.guideImg = guideImg;
    [guideImg sizeToFit];
    
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    [self.collectionView addSubview:largeText];
    self.largeText = largeText;
    
    [largeText sizeToFit];
    
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    [self.collectionView
     addSubview:smallText];
    self.smallText = smallText;
    [smallText sizeToFit];

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.picArr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ZHGuideViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:self.picArr[indexPath.row]]];
    //[self.collectionView addSubview:cell];
//    [cell mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.bottom.trailing.mas_equalTo(self.collectionView).offset(0);
//    }];
    
    return cell;

}


-(NSArray *)picArr{

    if (_picArr == nil) {
        _picArr = @[
                    @"guide1Background",
                    @"guide2Background",
                    @"guide3Background",
                    @"guide4Background"
                    ];
    }
    return _picArr;
}


@end
