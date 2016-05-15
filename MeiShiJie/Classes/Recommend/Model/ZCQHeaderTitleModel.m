//
//  ZCQHeaderTitleModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHeaderTitleModel.h"
#import "MJExtension.h"

@implementation ZCQHeaderTitleModel
+(instancetype)headerTitleWithDict:(NSDictionary *)dict
{
    ZCQHeaderTitleModel *model = [[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}

@end

