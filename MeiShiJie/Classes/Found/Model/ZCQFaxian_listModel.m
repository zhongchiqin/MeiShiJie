//
//  ZCQFaxian_listModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQFaxian_listModel.h"
#import <MJExtension.h>
@implementation ZCQFaxian_listModel

+(instancetype)dateWithDict:(NSDictionary *)dict
{
    ZCQFaxian_listModel *mine = [ZCQFaxian_listModel mj_objectWithKeyValues:dict];
    
    return mine;
}


@end
