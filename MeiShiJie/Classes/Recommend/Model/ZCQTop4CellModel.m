//
//  ZCQTop4CellModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTop4CellModel.h"
#import "MJExtension.h"

@implementation ZCQTop4CellModel
+(instancetype)top4WithDict:(NSDictionary *)dict
{
    ZCQTop4CellModel *model =[[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}
@end
