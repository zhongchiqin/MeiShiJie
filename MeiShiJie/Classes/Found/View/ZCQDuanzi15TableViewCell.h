//
//  ZCQDuanzi15TableViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCQDuanzi_info15Model.h"

typedef void(^PlayBtnCallBackBlock)(UIButton *);

@interface ZCQDuanzi15TableViewCell : UITableViewCell

@property(nonatomic, strong)ZCQDuanzi_info15Model *model;

@property (nonatomic, assign) CGFloat cellHeight;

@property (nonatomic, strong) UIButton *playBtn;
/** 播放按钮block */
@property (nonatomic, copy  ) PlayBtnCallBackBlock playBlock;

@property (strong, nonatomic) UIImageView *sourceView;

- (void)setCellWIthModel:(ZCQDuanzi_info15Model *)model;

//- (CGFloat)cellHeightWithModel:(ZCQDuanzi_info15Model *)model;
@end
