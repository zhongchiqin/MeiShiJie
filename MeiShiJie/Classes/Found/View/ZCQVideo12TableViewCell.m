//
//  ZCQVideo15TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/27.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQVideo12TableViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQVideo12TableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imgIcon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UIImageView *imgVideo;
@property (weak, nonatomic) IBOutlet UILabel *discribtion;
@property (weak, nonatomic) IBOutlet UILabel *playTimes;



@end

@implementation ZCQVideo12TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setCellWithModel:(ZCQVideo_list12Model *)model
{
    [_imgIcon sd_setImageWithURL:model.img];
    _name.text = model.name;
    _time.text = model.time;
    [_imgVideo sd_setImageWithURL:model.img_video];
    _discribtion.text = model.describtion;
    _playTimes.text = model.play_times;
    


}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
