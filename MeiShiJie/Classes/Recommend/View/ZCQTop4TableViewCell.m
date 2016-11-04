//
//  ZCQTop4TableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTop4TableViewCell.h"
#import "SDCycleScrollView.h"
#import "ZCQTop4CellModel.h"
#import "ZCQDetailWebViewController.h"

@interface ZCQTop4TableViewCell()<SDCycleScrollViewDelegate>
@property(nonatomic, strong)SDCycleScrollView *scrollerView;

@end


@implementation ZCQTop4TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatScrollerView];
    }
    return self;
}

-(void)creatScrollerView
{
    _scrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 5, ZCQWidth-20, 90) delegate:self placeholderImage:nil];
    _scrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _scrollerView.currentPageDotColor = MeiShiJieColor;
    _scrollerView.autoScrollTimeInterval = 3;
    [self.contentView addSubview:_scrollerView];
}

- (void)creatTop4:(NSDictionary *)dict
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in dict[@"top4"]) {
        ZCQTop4CellModel *model = [ZCQTop4CellModel top4WithDict:dic];
        [array addObject:model.photo];
    }
    _scrollerView.imageURLStringsGroup =array;
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    ZCQDetailWebViewController * top4 = [[ZCQDetailWebViewController alloc]init];
    top4.hidesBottomBarWhenPushed = YES;
    [self.vc.navigationController pushViewController:top4 animated:YES];
    NSLog(@"点击了第%ld张",index);
}
@end
