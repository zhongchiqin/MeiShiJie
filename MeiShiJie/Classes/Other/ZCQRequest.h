//
//  ZCQRequest.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef void(^CompleteBlock) (NSData *data);
typedef void(^FailtureBlock) (NSError *error);

@interface ZCQRequest : NSObject

+ (void)requestGetWithUrl:(NSString *)urlString Parameters:(NSDictionary *)dict Complete:(CompleteBlock)success Fail:(FailtureBlock)failture;


+ (void)requestPostWithUrl:(NSString *)urlString Parameters:(NSDictionary *)dict Complete:(CompleteBlock)success Fail:(FailtureBlock)failture;
@end
