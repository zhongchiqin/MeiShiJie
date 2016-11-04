//
//  ZCQTopic11TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/9/1.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTopic11TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZCQPhotoContainerView.h"

static CGFloat const margin = 8.f;
static CGFloat const contentFont = 17.f;
static CGFloat const contentLabelY = 88+ margin; // 30是头像高度

@interface ZCQTopic11TableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *tagLable;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *summary;

@property(nonatomic, strong)ZCQPhotoContainerView *picContaimerView;
@property (nonatomic, assign) CGFloat lableHeigth;
@end


@implementation ZCQTopic11TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (ZCQPhotoContainerView *)picContaimerView
{
    if (!_picContaimerView) {
        _picContaimerView = [[ZCQPhotoContainerView alloc]init];
    }
    return _picContaimerView;
}
- (void)setCellWithModel:(ZCQFaxian_listModel *)model
{
    _tagLable.layer.borderColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0].CGColor;
    _tagLable.layer.borderWidth = 1;
    _tagLable.textColor = [UIColor colorWithRed:0.1606 green:0.7537 blue:1.0 alpha:1.0];
    _avatar.layer.cornerRadius = 15;
    _avatar.clipsToBounds= YES;
    _title.text = model.title;
    _tagLable.text = model.tag;
    [_avatar sd_setImageWithURL:model.topic_info.avatar];
    _userName.text = model.topic_info.user_name;
    _summary.text = model.topic_info.summary;
    
    self.picContaimerView.picPathUrlArray = model.topic_info.imgs;
    
    CGPoint point = [self picContaimerViewOriginWithModel:model.topic_info];
    CGRect frame = self.picContaimerView.frame;
    frame.origin = point;
    
    self.picContaimerView.frame = frame;
    
    [self.contentView addSubview:_picContaimerView];
    
}

- (CGPoint)picContaimerViewOriginWithModel:(ZCQTopic_info11Model *)model
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
    CGFloat contentH = [model.summary boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                    context:nil].size.height;
    _lableHeigth = contentLabelY + contentH + margin;
    self.picContaimerView.picPathUrlArray = model.imgs;
    return CGPointMake(margin, _lableHeigth);
    
}

//- (void)
- (CGFloat)cellHeightWithModel:(ZCQTopic_info11Model *)model{
    if (model.cellHeigth) {
        return model.cellHeigth;
    }else{
        if (!_cellHeight) {
            CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
            CGFloat contentH = [model.summary boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                            options:NSStringDrawingUsesLineFragmentOrigin
                                                         attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                            context:nil].size.height;
            _lableHeigth = contentLabelY + contentH + margin;
            self.picContaimerView.picPathUrlArray = model.imgs;
            _cellHeight = _lableHeigth + self.picContaimerView.frame.size.height + 13;
        }
        model.cellHeigth = _cellHeight;
        return _cellHeight;
        
    }
}




@end
