//
//  ZCQLikeDataModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/17.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQLikeDataModel : NSObject

@property(nonatomic, copy)NSString *titlepic;
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSArray* id;

+(instancetype)likeDateWithDict:(NSDictionary *)dict;
@end
