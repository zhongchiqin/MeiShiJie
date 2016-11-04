//
//  ZCQZt9TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/9/1.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQZt9TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQZt9TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *tagLable;

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *userName;

@end

@implementation ZCQZt9TableViewCell

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
    [_photo sd_setImageWithURL:model.zt_info.photo];
    _userName.text = model.zt_info.user_name;
    
}
@end
