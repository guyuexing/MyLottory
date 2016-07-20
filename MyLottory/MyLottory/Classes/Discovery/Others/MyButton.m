//
//  ZHButton.m
//  MyLottory
//
//  Created by guyuexing on 16/5/17.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (void)layoutSubviews{
    [super layoutSubviews];
    self.titleLabel.x = 0;
    self.imageView.x = self.titleLabel.width + 5;
}

-(void)setHighlighted:(BOOL)highlighted{

}

@end
