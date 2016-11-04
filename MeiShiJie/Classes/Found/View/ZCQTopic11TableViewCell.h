//
//  ZCQTopic11TableViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/9/1.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCQTopic_info11Model.h"
#import "ZCQFaxian_listModel.h"

@interface ZCQTopic11TableViewCell : UITableViewCell
@property (nonatomic, assign) CGFloat cellHeight;

- (CGFloat)cellHeightWithModel:(ZCQTopic_info11Model *)model;

- (void)setCellWithModel:(ZCQFaxian_listModel *)model;

@end
