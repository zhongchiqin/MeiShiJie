//
//  ZCQFaxian_listModel.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZCQCaidan_info7Model;
@class ZCQZt_info9Model;
@class ZCQHuodong3Model;
@class ZCQRecipe_info1Model;
@class ZCQGongyi_info6Model;
@class ZCQShicai_info2Model;
@class ZCQArticle_info5Model;
@class ZCQGoods_info4;
@class ZCQTopic_info11Model;
@class ZCQVideo_list12Model;
@class ZCQDuanzi_info15Model;
@class ZCQWechat_info16Model;

@interface ZCQFaxian_listModel : NSObject


@property(nonatomic, copy)NSString *tag;

@property(nonatomic, copy)NSString *title;

@property(nonatomic, assign)NSInteger type;

@property(nonatomic, strong)ZCQCaidan_info7Model *caidan_info;

@property(nonatomic, strong)ZCQZt_info9Model *zt_info;

@property(nonatomic, strong)ZCQHuodong3Model *huodong;

@property(nonatomic, strong)ZCQRecipe_info1Model *recipe_info;

@property(nonatomic, strong)ZCQGongyi_info6Model *gongyi_info;

@property(nonatomic, strong)ZCQShicai_info2Model *shicai_info;

@property(nonatomic, strong)ZCQArticle_info5Model *article_info;

@property(nonatomic, strong)ZCQGoods_info4 *goods_info;

@property(nonatomic, strong)ZCQTopic_info11Model *topic_info;

@property(nonatomic, strong)ZCQVideo_list12Model *video_list;

@property(nonatomic, strong)ZCQDuanzi_info15Model *duanzi_info;

@property(nonatomic, strong)ZCQWechat_info16Model *wechat_info;

+(instancetype)dateWithDict:(NSDictionary *)dict;

@end
