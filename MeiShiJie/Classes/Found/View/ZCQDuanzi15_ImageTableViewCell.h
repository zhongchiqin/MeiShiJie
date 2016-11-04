//
//  ZCQDuanzi15_ImageTableViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/31.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCQDuanzi_info15Model.h"

@interface ZCQDuanzi15_ImageTableViewCell : UITableViewCell

@property(nonatomic, strong)ZCQDuanzi_info15Model *model;

@property (nonatomic, assign) CGFloat cellHeight;

- (void)setCellWIthModel:(ZCQDuanzi_info15Model *)model;

- (CGFloat)cellHeightWithModel:(ZCQDuanzi_info15Model *)model;

@end
