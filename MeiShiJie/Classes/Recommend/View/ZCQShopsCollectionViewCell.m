//
//  ZCQShopsCollectionViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQShopsCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation ZCQShopsCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)creatShopCellWithModel:(ZCQShopColectionModel *)model
{
    [_image sd_setImageWithURL:[NSURL URLWithString:model.image]];
    _title.text = model.title;
    _price.text = [NSString stringWithFormat:@"¥%@/",model.price];
    _price.textColor = MeiShiJieColor;
    _guige.text = model.guige;
    _guige.textColor = MeiShiJieColor;
}
@end
