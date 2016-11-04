//
//  ZCQWechat16TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQWechat16TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQWechat16TableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *titlePic;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *smallText;

@end

@implementation ZCQWechat16TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(ZCQWechat_info16Model *)model
{
    [_titlePic sd_setImageWithURL:model.titlepic];
    _title.text = model.title;
    _smallText.text = model.smalltext;
}

@end
