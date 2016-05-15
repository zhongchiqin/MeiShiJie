//
//  ZCQHeaderScrollerVIew.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHeaderScrollerVIew.h"

#import "ZCQHeaderScrollerView.h"
#import "UIImageView+WebCache.h"
#import "ZCQHeaderModel.h"
#import "ZCQHeaderTitleModel.h"

@interface ZCQHeaderScrollerVIew()<UIScrollViewDelegate>
{
    int page;
    UIPageControl *_pc;
}


@end
@implementation ZCQHeaderScrollerVIew

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor =[UIColor whiteColor];
        [self setUpUI];
    }
    return self;
}

- (UIScrollView *)scrollerView
{
    if (!_scrollerView) {
        _scrollerView = [[UIScrollView alloc]initWithFrame:self.bounds];
    }
    return _scrollerView;
}
- (UIPageControl *)pc
{
    if (!_pc) {
        _pc = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 470, ZCQWidth, 40)];
    }
    return _pc;
}

- (void)setDataArray:(NSArray *)dataArray
{
    [self clippingImageWithDataArray:(NSArray *)dataArray];
    
}

- (void)setTitleArray:(NSArray *)titleArray
{
    [self clippingImageWithTitleArray:(NSArray *)titleArray];
    [self createPageControlWithTitleArray:(NSArray *)titleArray];
    
}

- (void)setUpUI
{
    self.scrollerView.backgroundColor = MeiShiJIeBlackColor;
    self.scrollerView.contentSize = CGSizeMake(ZCQWidth *5, self.bounds.size.height);
    self.scrollerView.pagingEnabled = YES;
    self.scrollerView.showsVerticalScrollIndicator = NO;
    self.scrollerView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    self.scrollerView.delegate = self;
    [self addSubview:_scrollerView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    page = scrollView.contentOffset.x/ZCQWidth;
    _pc.currentPage = scrollView.contentOffset.x/ZCQWidth;
}


- (void)createPageControlWithTitleArray:(NSArray *)titleArray
{
#pragma mark - 小点点
    self.pc.numberOfPages = titleArray.count;
    // 把小点点的用户交互关掉
    self.pc.userInteractionEnabled = NO;
    // 设置小点点的颜色
    self.pc.currentPageIndicatorTintColor = MeiShiJieColor;
    self.pc.pageIndicatorTintColor = [UIColor lightGrayColor];
    [self addSubview:_pc];
}

- (void)clippingImageWithDataArray:(NSArray *)dataArray{
    int t = 0;
    
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 3; j++) {
            
            ZCQHeaderModel *model = [ZCQHeaderModel headerWithDict:dataArray[t]];
            
            UIImageView * imageView  = [[UIImageView alloc]initWithFrame:CGRectMake(ZCQWidth*i + 10, 100*j, ZCQWidth-20, 150)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.titlepic] placeholderImage:nil];
            UIBezierPath *path = [UIBezierPath bezierPath];
            path.lineCapStyle = kCGLineCapRound; //线条拐角
            path.lineJoinStyle = kCGLineCapRound; //终点处理
            
            
            UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(10, 90, ZCQWidth-40, 20)];
            label1.text = model.title;
            UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, ZCQWidth-40, 20)];
            label2.text = model.descr;
            label1.textAlignment = NSTextAlignmentRight;
            label1.textColor = [UIColor lightGrayColor];
            label1.font = [UIFont boldSystemFontOfSize:20];
            label2.textAlignment = NSTextAlignmentRight;
            label2.textColor = [UIColor lightGrayColor];
            
            if (j == 0) {
                imageView.frame = CGRectMake(ZCQWidth*i +10, 0+5, ZCQWidth-20, 150);
                [path moveToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 0)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 150)];
                [path addLineToPoint:CGPointMake(0, 130)];
                [path closePath];
            }else if (j == 1) {
                imageView.frame = CGRectMake(ZCQWidth*i+10, 140, ZCQWidth-20, 150);
                [path moveToPoint:CGPointMake(0, 0)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 20)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 130)];
                [path addLineToPoint:CGPointMake(0, 150)];
                [path closePath];
                
                label1.textAlignment = NSTextAlignmentLeft;
                label2.textAlignment = NSTextAlignmentLeft;
            }else if (j == 2){
                imageView.frame = CGRectMake(ZCQWidth*i+10, 270, ZCQWidth-20, 150);
                [path moveToPoint:CGPointMake(0, 25)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 5)];
                [path addLineToPoint:CGPointMake(ZCQWidth, 150)];
                [path addLineToPoint:CGPointMake(0, 150)];
                [path closePath];
            }
            CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
            shapeLayer.path = path.CGPath;
            imageView.layer.mask = shapeLayer;
            [imageView addSubview:label2];
            [imageView addSubview:label1];
            [_scrollerView addSubview:imageView];
            t++;
        }
    }
}

- (void)clippingImageWithTitleArray:(NSArray *)titleArray
{
    for (int i = 0; i < 5; i++) {
        ZCQHeaderTitleModel *model = [ZCQHeaderTitleModel headerTitleWithDict:titleArray[i]];
        UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(ZCQWidth * i, 430, ZCQWidth, 20)];
        UILabel *lable2 = [[UILabel alloc]initWithFrame:CGRectMake(ZCQWidth * i, 450, ZCQWidth, 20)];
        label1.numberOfLines = 0;
        label1.textAlignment = NSTextAlignmentCenter;
        label1.text = model.title;
        lable2.numberOfLines = 0;
        lable2.textAlignment = NSTextAlignmentCenter;
        lable2.text = model.sub_title;
        lable2.font = [UIFont systemFontOfSize:13];
        [_scrollerView addSubview:label1];
        [_scrollerView addSubview:lable2];
    }
}


@end

