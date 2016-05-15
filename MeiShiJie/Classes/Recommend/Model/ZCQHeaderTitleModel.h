//
//  ZCQHeaderTitleModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQHeaderTitleModel : NSObject

@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *sub_title;

+(instancetype)headerTitleWithDict:(NSDictionary *)dict;
@end
