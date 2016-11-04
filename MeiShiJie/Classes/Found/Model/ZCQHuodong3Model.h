//
//  ZCQHuodong3Model.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>
//type 3
@class  ZCQImageModel;

@interface ZCQHuodong3Model : NSObject

@property(nonatomic, copy)NSString *huodong_id;

@property(nonatomic, copy)NSString *huodong_type;

@property(nonatomic, strong)ZCQImageModel *img;

@end
