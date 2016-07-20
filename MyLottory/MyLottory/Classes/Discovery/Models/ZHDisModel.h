//
//  ZHDisModel.h
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHDisModel : NSObject

@property (nonatomic,copy) NSString *titleImg;
@property (nonatomic,copy) NSString *imageName;
@property (nonatomic,copy) NSString *subTitle;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
