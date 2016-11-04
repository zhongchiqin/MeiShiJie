//
//  ZCQTop3CellModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQTop3CellModel : NSObject

@property(nonatomic, copy)NSString *photo;
@property(nonatomic, copy)NSString *click_obj;

+(instancetype)top3WithDict:(NSDictionary *)dict;

@end
