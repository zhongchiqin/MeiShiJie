//
//  ZCQFoundModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/7/30.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQFoundModel : NSObject

@property(nonatomic, copy)NSString *msg;
@property(nonatomic, copy)NSString *faxian_region;
@property(nonatomic, assign)NSInteger code;
@property(nonatomic, strong)NSArray *faxian_list;

+(instancetype)dateWithDict:(NSDictionary *)dict;

@end
