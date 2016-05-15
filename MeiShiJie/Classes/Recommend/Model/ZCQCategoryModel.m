//
//  ZCQCategoryModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQCategoryModel.h"
#import "MJExtension.h"
@implementation ZCQCategoryModel
+(instancetype)categoryWithDict:(NSDictionary *)dict
{
    ZCQCategoryModel *model =[[self alloc]init];
    [model mj_setKeyValues:dict];
    return model;
}
@end
