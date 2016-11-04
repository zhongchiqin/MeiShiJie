//
//  ZCQShicai2TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQShicai2TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQShicai2TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tagLable;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UIView *gongXiaoView;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *heat_word;
@property (nonatomic, assign)CGFloat frameWidth;
@end

@implementation ZCQShicai2TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    _frameWidth = self.gongXiaoView.frame.size.width;
}

- (void)setCellWithModel:(ZCQFaxian_listModel *)model
{
    
    
    _tagLable.layer.borderColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0].CGColor;
    _tagLable.layer.borderWidth = 1;
    _tagLable.textColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0];
    _title.text = model.title;
    _tagLable.text = model.tag;
    [_image sd_setImageWithURL:model.shicai_info.image];
    _name.text = model.shicai_info.title;
    _heat_word.text = model.shicai_info.heat_word;
    
   
    CGFloat tagWidth = 0.0f;
    CGFloat tagHeigth = 0.0f;
    
    for (UILabel *lable in _gongXiaoView.subviews) {
        [lable removeFromSuperview];
    }
    
    for (NSString *tag in model.shicai_info.gongxiao) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(tagWidth, tagHeigth, 0, 0)];
        label.text = tag;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:15];
        NSDictionary *attribute = @{NSFontAttributeName: label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(_frameWidth, MAXFLOAT) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        label.frame = CGRectMake(tagWidth, 0, size.width + 8, size.height + 8);
        label.backgroundColor = [UIColor lightGrayColor];
        label.textColor = [UIColor grayColor];
        tagWidth += label.frame.size.width + 5;
        tagHeigth = label.frame.size.height;
        
        if (tagWidth >= _frameWidth) {
            break;
        }
        [_gongXiaoView addSubview:label];
    }

}
@end
