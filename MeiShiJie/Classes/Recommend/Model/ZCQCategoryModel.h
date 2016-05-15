//
//  ZCQCategoryModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQCategoryModel : NSObject
@property(nonatomic, copy)NSString *title;
@property(nonatomic, copy)NSString *image;

+(instancetype)categoryWithDict:(NSDictionary *)dict;
@end
