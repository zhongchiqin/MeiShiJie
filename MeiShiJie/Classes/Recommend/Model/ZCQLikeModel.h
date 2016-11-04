//
//  ZCQLikeModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/17.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCQLikeDataModel;

@interface ZCQLikeModel : NSObject
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *time;
@property(nonatomic, copy)NSMutableArray* data;
@property(nonatomic, copy)NSString *id;

+(instancetype)likeWithDict:(NSDictionary *)dict;

@end
