//
//  ZCQHeaderModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHeaderModel.h"
#import "MJExtension.h"
@implementation ZCQHeaderModel

+(instancetype)headerWithDict:(NSDictionary *)dict
{
    ZCQHeaderModel *model = [ZCQHeaderModel mj_objectWithKeyValues:dict];
//    MJUser *user = [MJUser mj_objectWithKeyValues:dict];
    [model mj_setKeyValues:dict];
    return model;
}
@end
  