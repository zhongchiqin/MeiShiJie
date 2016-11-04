//
//  ZCQTopic_info11Model.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  ZCQImageModel;
/**
 {
 "id": 1,
 "title": "\u8fd9\u4e2a\u5e16\u5b50\u5c31\u8fd9\u4e48\u7ea2\u4e86...",
 "type": "11",
 "tag": "\u8bc4\u8bba\u6700\u591a",
 "topic_info": {
 "user_info": {
 "signature": "\u6b63\u5728\u901a\u5f80\u7f8e\u98df\u8fbe\u4eba\u7684\u8def\u4e0a...",
 "if_v": "1",
 "user_id": "6668412",
 "user_name": "twinsliuliu",
 "avatar": "http:\/\/site.meishij.net\/user\/162\/173\/t6668412_146914330403720.jpg"
 },
 "gid": "23",
 "tid": "1181159",
 "comment_num": 116,
 "is_ding": "0",
 "ding_num": "47",
 "time": "2016-08-29\u53d1\u5e03",
 "summary": "\u5982\u679c\u89c6\u5403\u996d\u4ec5\u4e3a\u679c\u8179\uff0c\u90a3\u505a\u996d\u53ea\u80fd\u7b97\u662f\u51fa\u4e8e\u5bf9\u80c3\u7684\u8d23\u4efb\u3002\u5982\u679c\u628a\u5403\u996d\u4f5c\u4e3a\u4e50\u8da3\uff0c\u5f53\u7f8e\u98df\u9082\u9005...",
 "img_num": 9,
 "zhiding": "",
 "imgs": [{
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117165738.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117165738.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117140831.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117140831.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117415300.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117415300.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117410555.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117410555.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117637558.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117637558.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117634932.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117634932.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117857789.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117857789.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245117835793.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245117835793.jpg",
 "width": "162",
 "height": "162"
 }, {
 "small": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s1626668412_147245118138135.jpg",
 "big": "http:\/\/site.meishij.net\/msq\/162\/173\/6668412\/s6406668412_147245118138135.jpg",
 "width": "162",
 "height": "162"
 }],
 "recipes": [],
 "sourceType": "0"
 }
	}
 
 */
@interface ZCQTopic_info11Model : NSObject

@property(nonatomic, copy)NSString *comment_num;

@property(nonatomic, copy)NSString *ding_num;

@property(nonatomic, copy)NSString *gid;

@property(nonatomic, copy)NSString *img_num;

@property(nonatomic, strong)NSArray *imgs;

@property(nonatomic, copy)NSString *is_ding;

@property(nonatomic, strong)NSArray *recipes;

@property(nonatomic, copy)NSString *sourceType;

@property(nonatomic, copy)NSString *summary;

@property(nonatomic, copy)NSString *tid;

@property(nonatomic, copy)NSString *time;

@property(nonatomic, copy)NSURL *avatar;

@property(nonatomic, copy)NSString *if_v;

@property(nonatomic, copy)NSString *signature;

@property(nonatomic, copy)NSString *user_id;

@property(nonatomic, copy)NSString *user_name;



@property(nonatomic, copy)NSString *zhiding;


@property(nonatomic, assign)CGFloat cellHeigth;
@end
