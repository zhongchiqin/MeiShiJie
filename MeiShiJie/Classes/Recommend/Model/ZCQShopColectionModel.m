//
//  ZCQShopColectionModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQShopColectionModel.h"
#import "MJExtension.h"

@implementation ZCQShopColectionModel
+(instancetype)shopsWithDict:(NSDictionary *)dict
{
    ZCQShopColectionModel *model =[[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}
@end
