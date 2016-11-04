//
//  ZCQTop4CellModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQTop4CellModel : NSObject
@property(nonatomic, copy)NSString *photo;
@property(nonatomic, copy)NSString *click_obj;

+(instancetype)top4WithDict:(NSDictionary *)dict;
@end
