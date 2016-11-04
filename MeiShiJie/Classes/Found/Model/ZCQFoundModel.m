//
//  ZCQFoundModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/7/30.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQFoundModel.h"
#import <MJExtension.h>

@implementation ZCQFoundModel

+(instancetype)dateWithDict:(NSDictionary *)dict
{
    ZCQFoundModel *mine = [ZCQFoundModel mj_objectWithKeyValues:dict];
    
    return mine;
}


@end
