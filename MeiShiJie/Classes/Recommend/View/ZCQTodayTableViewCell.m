//
//  ZCQTodayTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/12.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTodayTableViewCell.h"
#import "ZCQMoreSelcetView.h"
@interface ZCQTodayTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *moreBut;

@property(nonatomic, strong)ZCQMoreSelcetView *selectView;


@end

@implementation ZCQTodayTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void )setDataarray:(NSArray *)dataarray
{
    _dataarray = dataarray;

}
- (ZCQMoreSelcetView *)selectView
{
    if (_selectView) {
        [_selectView removeFromSuperview];
        _selectView = nil;
    }
    _selectView = [[ZCQMoreSelcetView alloc]init];
//    NSArray *array = @[@"饮食健康",@"功能性调理",@"人群膳食",@"疾病调理",@"脏腑调理",@"烹饪技巧"];
    [_selectView creatWithBackgroungViewWithArray:_dataarray];
    return _selectView;
}

- (IBAction)moreBut:(id)sender{
     CGRect rc =  [_moreBut convertRect:_moreBut.frame toView:_controller];
    if (_controller.frame.size.height - rc.origin.y - 20 < 250) {
        [self.selectView showSlideMenuPanelWithSelectFrame:CGRectMake(10, rc.origin.y-250 + 64-20, ZCQWidth-20, 250)];
    }else{
        [self.selectView showSlideMenuPanelWithSelectFrame:CGRectMake(10, rc.origin.y + 64 + 20, ZCQWidth-20, 250)];
    }
}

@end
