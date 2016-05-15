//
//  ZCQHeaderModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQHeaderModel : NSObject
@property(nonatomic, copy)NSString *id;
@property(nonatomic, copy)NSString *titlepic;
@property(nonatomic, copy)NSString *title;
@property(nonatomic , copy)NSString *descr;

+(instancetype)headerWithDict:(NSDictionary *)dict;
@end
