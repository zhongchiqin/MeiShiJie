//
//  ZCQSearchTextField.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/12.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQSearchTextField.h"

@implementation ZCQSearchTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.font = [UIFont systemFontOfSize:16];
        self.backgroundColor = MeiShiJIeBlackColor;
        self.clearButtonMode = UITextFieldViewModeAlways;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 5;
        
        //设置文边框左边专属View
        UIImageView *leftView = [[UIImageView alloc] init];
        leftView.bounds = CGRectMake(0, 0, 30, 35);
        //        leftView.contentMode = UIViewContentModeCenter;
        
        leftView.image = [UIImage imageNamed:@"search_topbar"];
        
        self.leftView = leftView;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    return self;
}

@end
