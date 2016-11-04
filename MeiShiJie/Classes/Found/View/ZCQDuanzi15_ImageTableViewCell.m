//
//  ZCQDuanzi15_ImageTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/31.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQDuanzi15_ImageTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZCQPhotoContainerView.h"

static CGFloat const margin = 8.f;
static CGFloat const contentFont = 17.f;
static CGFloat const contentLabelY = 13 + 30.f + margin; // 30是头像高度

@interface ZCQDuanzi15_ImageTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property(nonatomic, strong)ZCQPhotoContainerView *picContaimerView;

@property (nonatomic, assign) CGFloat lableHeigth;
@end

@implementation ZCQDuanzi15_ImageTableViewCell

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

- (void)setCellWIthModel:(ZCQDuanzi_info15Model *)model
{
    _model = model;
    _avatar.layer.cornerRadius = 15;
    _avatar.clipsToBounds= YES;
    [_avatar sd_setImageWithURL:model.avatar];
    _userName.text = _model.user_name;
    _content.text = _model.content;
    self.picContaimerView.picPathUrlArray = model.imgs;
    
    CGPoint point = [self picContaimerViewOriginWithModel:model];
    CGRect frame = self.picContaimerView.frame;
    frame.origin = point;
    
    self.picContaimerView.frame = frame;
    
    [self.contentView addSubview:_picContaimerView];
}

- (CGPoint)picContaimerViewOriginWithModel:(ZCQDuanzi_info15Model *)model
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
    CGFloat contentH = [_model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                    options:NSStringDrawingUsesLineFragmentOrigin
                                                 attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                    context:nil].size.height;
    _lableHeigth = contentLabelY + contentH + margin;
    self.picContaimerView.picPathUrlArray = model.imgs;
    return CGPointMake(margin, _lableHeigth);

}

//- (void)
- (CGFloat)cellHeightWithModel:(ZCQDuanzi_info15Model *)model{
    _model = model;
    if (_model.cellHeigth) {
        return _model.cellHeigth;
    }else{
        if (!_cellHeight) {
        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
        CGFloat contentH = [_model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
                                                        context:nil].size.height;
        _lableHeigth = contentLabelY + contentH + margin;
        self.picContaimerView.picPathUrlArray = model.imgs;
        _cellHeight = _lableHeigth + self.picContaimerView.frame.size.height + 13;
    }
        _model.cellHeigth = _cellHeight;
        return _cellHeight;
    
    }
}

//
//- (CGFloat)videoViewHeigthWithModel:(ZCQDuanzi_info15Model *)model
//{
//    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * 16; // 屏幕宽度减去左右间距
//    if (model.video_width <= contentW) {
//        return model.video_height;
//    }else
//        return  contentW / model.video_width * model.video_height;
//    
//    
//}
@end
