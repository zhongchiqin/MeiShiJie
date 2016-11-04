//
//  ZCQLikeModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/17.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQLikeModel.h"
#import "MJExtension.h"

@implementation ZCQLikeModel
+(instancetype)likeWithDict:(NSDictionary *)dict
{
    ZCQLikeModel *model =[[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}


@end
