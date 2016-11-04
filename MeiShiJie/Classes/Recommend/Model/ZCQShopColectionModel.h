//
//  ZCQShopColectionModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQShopColectionModel : NSObject
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *image;
@property(nonatomic, copy)NSString *price;
@property(nonatomic, copy)NSString *guige;

+(instancetype)shopsWithDict:(NSDictionary *)dict;

@end
