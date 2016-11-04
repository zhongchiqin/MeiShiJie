//
//  ZCQImageModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQImageModel : NSObject

@property(nonatomic, assign)double height;

@property(nonatomic, copy)NSURL *small;

@property(nonatomic, copy)NSURL *big;

@property(nonatomic, assign)double width;

@property(nonatomic, strong)UIImage *imagePic;

+ (instancetype)dataWithDict:(NSDictionary *)dict;
@end
