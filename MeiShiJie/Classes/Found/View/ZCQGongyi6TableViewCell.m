//
//  ZCQGongyi6TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQGongyi6TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQGongyi6TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tagLable;
@property (weak, nonatomic) IBOutlet UIImageView *pic1;
@property (weak, nonatomic) IBOutlet UILabel *name1;
@property (weak, nonatomic) IBOutlet UIImageView *pic2;
@property (weak, nonatomic) IBOutlet UILabel *name2;
@property (weak, nonatomic) IBOutlet UIImageView *pic3;
@property (weak, nonatomic) IBOutlet UILabel *name3;

@end

@implementation ZCQGongyi6TableViewCell

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
    [_pic1 sd_setImageWithURL:model.gongyi_info.recipes[0][@"titlepic"]];
    _name1.text = model.gongyi_info.recipes[0][@"title"];
    [_pic2 sd_setImageWithURL:model.gongyi_info.recipes[1][@"titlepic"]];
    _name2.text = model.gongyi_info.recipes[1][@"title"];
    [_pic3 sd_setImageWithURL:model.gongyi_info.recipes[2][@"titlepic"]];
    _name3.text = model.gongyi_info.recipes[2][@"title"];

}

@end
