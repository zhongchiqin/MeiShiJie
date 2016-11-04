
//
//  ZCQTopic_info11Model.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTopic_info11Model.h"


@implementation ZCQTopic_info11Model

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"avatar" : @"user_info.avatar",
             @"if_v" : @"user_info.if_v",
             @"signature" : @"user_info.asignature",
             @"user_id" : @"user_info.user_id",
             @"user_name" : @"user_info.user_name",
             };
}

@end
