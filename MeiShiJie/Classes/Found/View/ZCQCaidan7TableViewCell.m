//
//  ZCQCaidanTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/9/1.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQCaidan7TableViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ZCQCaidan7TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(ZCQFaxian_listModel *)model
{
    _tagLable.layer.borderColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0].CGColor;
    _tagLable.layer.borderWidth = 1;
    _tagLable.textColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0];
    _title.text = model.title;
    _tagLable.text = model.tag;
    _caidanName.text = model.caidan_info.caidan_name;
    if (model.caidan_info.photos.count >= 3) {
        [_pic1 sd_setImageWithURL:model.caidan_info.photos[0]];
        [_pic2 sd_setImageWithURL:model.caidan_info.photos[1]];
        [_pic3 sd_setImageWithURL:model.caidan_info.photos[2]];
    }
    

}
@end
