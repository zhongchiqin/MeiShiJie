//
//  ZCQTop3CellModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTop3CellModel.h"
#import "MJExtension.h"

@implementation ZCQTop3CellModel
+(instancetype)top3WithDict:(NSDictionary *)dict
{
    ZCQTop3CellModel *model =[[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}
@end
