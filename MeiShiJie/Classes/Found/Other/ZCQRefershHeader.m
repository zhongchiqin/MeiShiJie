//
//  ZCQRefershHeader.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/28.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQRefershHeader.h"

@implementation ZCQRefershHeader

- (void)prepare
{
    [super prepare];
    // 设置普通状态的动画图片
//    NSMutableArray *idleImages = [NSMutableArray array];
//    for (NSUInteger i = 1; i<=9; i++) {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"potActivity_%zd", i]];
//        [idleImages addObject:image];
//    }
    [self setImages:@[[UIImage imageNamed:@"potActivity_1"]] forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
    NSMutableArray *refreshingImages = [NSMutableArray array];
    for (NSUInteger i = 1; i<=9; i++) {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"potActivity_%zd", i]];
        [refreshingImages addObject:image];
    }
    [self setImages:@[[UIImage imageNamed:@"potActivity_1"]] forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [self setImages:refreshingImages forState:MJRefreshStateRefreshing];

}

@end
