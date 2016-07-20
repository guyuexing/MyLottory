//
//  ZHDisModel.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "ZHDisModel.h"

@implementation ZHDisModel

- (instancetype)initWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)modelWithDict:(NSDictionary *)dict{

    return [[self alloc] initWithDict:dict];
    
}

@end
