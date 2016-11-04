//
//  ZCQDuanzi_info15Model.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQDuanzi_info15Model.h"
#import "UIImage+WebP.h"

static CGFloat const margin = 8.f;
static CGFloat const contentFont = 17.f;
static CGFloat const contentLabelY = 13 + 30.f + margin; // 30是头像高度

@implementation ZCQDuanzi_info15Model
//{
//    UIImage *_imagePic;
//}


+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"avatar" : @"user_info.avatar",
             @"if_v" : @"user_info.if_v",
             @"signature" : @"user_info.asignature",
             @"user_id" : @"user_info.user_id",
             @"user_name" : @"user_info.user_name",
             
             @"video_width" : @"video_list.video_width",
             @"video_height" : @"video_list.video_height",
             @"play_times" : @"video_list.play_times",
             @"img_video" : @"video_list.img_video",
             @"time" : @"video_list.time",
              @"vurl" : @"video_list.vurl",
           
             };
}

- (CGFloat)cellHeigth {
    switch (self.media_type) {
        case 2:
            if (!_cellHeigth) {
                CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
                CGFloat contentH = [self.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                              options:NSStringDrawingUsesLineFragmentOrigin
                                                           attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                              context:nil].size.height;
                _cellHeigth = contentLabelY + contentH + margin;
                
                if (self.video_width <= contentW) {
                    contentW =  self.video_width;
                }else{
                    contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距;
                }
                _contentImageFrame = CGRectMake( margin, _cellHeigth, contentW, [self videoViewHeigth]);
                _cellHeigth = _cellHeigth + [self videoViewHeigth] + 13;
            }
            return _cellHeigth;
            break;
            
        default:
            return _cellHeigth;
            break;
    }
    
}


- (CGFloat)videoViewHeigth
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
    if (self.video_width <= contentW) {
        return self.video_height;
    }else
        return  contentW / self.video_width * self.video_height;
}
@end
