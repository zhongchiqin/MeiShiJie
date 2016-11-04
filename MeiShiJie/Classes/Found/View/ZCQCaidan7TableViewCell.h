//
//  ZCQCaidanTableViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/9/1.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCQFaxian_listModel.h"
#import "ZCQCaidan_info7Model.h"

@interface ZCQCaidan7TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tagLable;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;
@property (weak, nonatomic) IBOutlet UIImageView *pic3;

@property (weak, nonatomic) IBOutlet UILabel *caidanName;

- (void)setCellWithModel:(ZCQFaxian_listModel *)model;

@end
