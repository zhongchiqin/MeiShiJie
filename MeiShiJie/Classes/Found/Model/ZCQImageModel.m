//
//  ZCQImageModel.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQImageModel.h"
#import <MJExtension.h>
#import "UIImage+WebP.h"

@implementation ZCQImageModel
+ (instancetype)dataWithDict:(NSDictionary *)dict
{
    ZCQImageModel *model = [ZCQImageModel mj_objectWithKeyValues:dict];
    return model;
}


//- (UIImage *)imagePic
//{
//    
//    if (!_imagePic) {
//        dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        dispatch_async(globalQueue, ^{
//            NSData *data  = [[NSData alloc]initWithContentsOfURL:self.small];
//            _imagePic = [UIImage imageWithWebPData:data];
//            
//        });
//    }
//    return _imagePic;
//}

@end
