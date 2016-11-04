//
//  ZCQDuanzi15TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQDuanzi15TableViewCell.h"
#import "UIImageView+WebCache.h"
#import "UIImage+WebP.h"

//static CGFloat const margin = 8.f;
//static CGFloat const contentFont = 17.f;
//static CGFloat const contentLabelY = 13 + 30.f + margin; // 30是头像高度

@interface ZCQDuanzi15TableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@property (weak, nonatomic) IBOutlet UILabel *userName;
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (nonatomic, strong) UILabel *timeLable;

@property (nonatomic, assign) CGFloat lableHeigth;

//@property (nonatomic, assign) CGFloat cellHeight;
// 图片将要展示的frame
@property (nonatomic, assign) CGRect contentImageFrame;

@end

@implementation ZCQDuanzi15TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
}

- (UIView *)sourceView
{
    if (!_sourceView) {
        _sourceView = [[UIImageView alloc]init];
        _sourceView.backgroundColor = [UIColor lightGrayColor];
        _sourceView.userInteractionEnabled = YES;
        [self.contentView addSubview:_sourceView];
    }
    return _sourceView;
}

- (UILabel *)timeLable
{
    if (!_timeLable) {
        _timeLable = [[UILabel alloc]init];
        _timeLable.font = [UIFont systemFontOfSize:13];
        _timeLable.textColor = [UIColor whiteColor];
         [self.sourceView addSubview:_timeLable];
    }
    return _timeLable;
}

- (void)setCellWIthModel:(ZCQDuanzi_info15Model *)model
{
    _model = model;
    _avatar.layer.cornerRadius = 15;
    _avatar.clipsToBounds= YES;
    [_avatar sd_setImageWithURL:model.avatar];
    _userName.text = _model.user_name;
    _content.text = _model.content;
    self.sourceView.frame = model.contentImageFrame;
    [self setVideoWithModel];
    
//           NSLog(@"%@",NSStringFromCGRect(self.contentImageFrame));
   
}
- (void)setVideoWithModel
{

    self.timeLable.text = _model.play_times;
    [self.timeLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sourceView.mas_left).offset(5);
        make.bottom.equalTo(self.sourceView.mas_bottom).offset(8);
        make.height.equalTo(@40);
        make.width.equalTo(@200);
        
    }];
    
    self.sourceView.tag = 101;
    // 代码添加playerBtn到imageView上
    self.playBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.playBtn setImage:[UIImage imageNamed:@"videoicon"] forState:UIControlStateNormal];
    [self.playBtn addTarget:self action:@selector(play:) forControlEvents:UIControlEventTouchUpInside];
    [self.sourceView addSubview:self.playBtn];
    [self.playBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.sourceView);
        make.height.equalTo(@50);
        make.width.equalTo(@50);
        
    }];
//    "http://p3.pstatp.com/large/c4a00062166308189d2.webp"
    [self.sourceView sd_setImageWithURL:_model.img_video];

}

- (void)play:(UIButton *)sender {
    
    if (self.playBlock) {
        self.playBlock(sender);
    }
}

//- (CGRect)contentImageFrame
//{
//    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间
//    CGFloat contentH = [_model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
//                                                        options:NSStringDrawingUsesLineFragmentOrigin
//                                                     attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
//                                                        context:nil].size.height;
//    _lableHeigth = contentLabelY + contentH + margin;
//    
//    if (_model.video_width <= contentW) {
//        contentW =  _model.video_width;
//    }else{
//        contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距;
//        }
//    _contentImageFrame = CGRectMake( margin, _lableHeigth, contentW, [self videoViewHeigthWithModel:_model]);
//    return _contentImageFrame;
//}


//- (CGFloat)cellHeightWithModel:(ZCQDuanzi_info15Model *)model{
//    _model = model;
//    if (_model.cellHeigth) {
//        return _model.cellHeigth;
//    }else{
//        if (!_cellHeight) {
//        CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
//        CGFloat contentH = [_model.content boundingRectWithSize:CGSizeMake(contentW, MAXFLOAT)
//                                                      options:NSStringDrawingUsesLineFragmentOrigin
//                                                   attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:contentFont]}
//                                                      context:nil].size.height;
//        _lableHeigth = contentLabelY + contentH + margin;
//            _cellHeight = _lableHeigth + [self videoViewHeigthWithModel:model] + 13;
//        }
//        model.cellHeigth = _cellHeight;
//        return _cellHeight;
//    }
//}
//
//- (CGFloat)videoViewHeigthWithModel:(ZCQDuanzi_info15Model *)model
//{
//    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
//    if (model.video_width <= contentW) {
//        return model.video_height;
//    }else
//        return  contentW / model.video_width * model.video_height;
//}

@end
