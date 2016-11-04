//
//  ZCQDuanzi_info15Model.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCQDuanzi_info15Model : NSObject

@property(nonatomic, copy)NSURL *web_url;

@property(nonatomic, copy)NSString *content;

@property(nonatomic, copy)NSString *id;

@property(nonatomic, copy)NSString *if_v;

@property(nonatomic, copy)NSString *signature;

@property(nonatomic, copy)NSString *user_id;

@property(nonatomic, copy)NSString *user_name;

@property(nonatomic, copy)NSURL *avatar;

@property(nonatomic, assign)NSInteger media_type;

@property(nonatomic, strong)NSArray *imgs;

@property(nonatomic, assign)CGFloat video_width;

@property(nonatomic, assign)CGFloat video_height;

@property(nonatomic, copy)NSString *play_times;



@property(nonatomic, copy)NSURL *img_video;

//@property(nonatomic, strong)UIImage *imagePic;




@property(nonatomic, copy)NSString *time;

@property(nonatomic, copy)NSURL *vurl;


@property(nonatomic, assign)CGFloat cellHeigth;

// 图片将要展示的frame
@property (nonatomic, assign) CGRect contentImageFrame;

@end
