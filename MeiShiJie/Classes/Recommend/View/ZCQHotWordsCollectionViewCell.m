//
//  ZCQHotWordsCollectionViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHotWordsCollectionViewCell.h"

@implementation ZCQHotWordsCollectionViewCell
{
    UILabel *_lable;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height)];
        
        _lable.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_lable];
    }
    return self;
}

- (void)creatLableWithWordsWithHotWords:(NSString *)hotWords;
{
    _lable.text = hotWords;
}
@end
