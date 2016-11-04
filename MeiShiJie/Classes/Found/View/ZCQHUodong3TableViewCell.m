//
//  ZCQHUodong3TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHUodong3TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQHUodong3TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *tagLable;

@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

@implementation ZCQHUodong3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(ZCQFaxian_listModel *)model
{
    _tagLable.layer.borderColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0].CGColor;
    _tagLable.layer.borderWidth = 1;
    _title.text = model.title;
    _tagLable.text = model.tag;
    [_img sd_setImageWithURL:model.huodong.img.small];
}


@end
