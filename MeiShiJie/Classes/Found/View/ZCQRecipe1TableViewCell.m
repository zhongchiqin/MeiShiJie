//
//  ZCQRecipe1TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQRecipe1TableViewCell.h"
#import "ZCQStarView.h"
#import "UIImageView+WebCache.h"

@interface ZCQRecipe1TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tagLable;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;

@property (weak, nonatomic) IBOutlet ZCQStarView *star;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *kouwei;


@end

@implementation ZCQRecipe1TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(ZCQFaxian_listModel *)model
{
    
    _tagLable.layer.borderColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0]
    .CGColor;
    _tagLable.layer.borderWidth = 1;
    _tagLable.textColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0];
    
    _title.text = model.title;
    _tagLable.text = model.tag;
    [_img sd_setImageWithURL:model.recipe_info.titlepic];
    _name.text = model.recipe_info.title;
    [_star setImagesDeselected:@"ms_caipu_level_un" partlySelected:@"" fullSelected:@"ms_caipu_level"];
    [_star displayRating:model.recipe_info.rate];
    _time.text = [NSString stringWithFormat:@"%@步 / %@",model.recipe_info.step,model.recipe_info.make_time];
    _kouwei.text = [NSString stringWithFormat:@"%@ / %@",model.recipe_info.kouwei,model.recipe_info.gongyi];
}

@end
