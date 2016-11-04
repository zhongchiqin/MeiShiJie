//
//  ZCQMoreSelcetView.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/13.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQMoreSelcetView.h"

@interface ZCQMoreSelcetView()
@property(nonatomic, strong) UIView *backgroundView;
@property(nonatomic, strong) UIView *selectView;
@property(nonatomic, strong) NSArray *dataArray;
@property(nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ZCQMoreSelcetView

- (instancetype)initWithFrame:(CGRect)frame
{
    UIWindow *window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self = [super initWithFrame:CGRectMake(0, 0,  window.bounds.size.width, window.bounds.size.height)];
    if (self) {
        
    }
    return self;
}

- (void)creatWithBackgroungViewWithArray:(NSArray *)arr{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:self.frame];
        _backgroundView.backgroundColor =  [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.3];
        [self addSubview:_backgroundView];
    }
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissSelectView)];
    [_backgroundView addGestureRecognizer:gr];
    
    if (!_selectView) {
        _selectView = [[UIView alloc]init];
        _selectView.backgroundColor = [UIColor whiteColor];
        _selectView.layer.cornerRadius = 8;
        [self addSubview:_selectView];
    }
    [self creatSelcetViewWithArray:arr];
  
}

- (void)creatSelcetViewWithArray:(NSArray *)arr
{
    UILabel *lable  = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    lable.text = @"不喜欢?";
    lable.font = [UIFont systemFontOfSize:22];
    lable.textColor = [UIColor lightGrayColor];
    [_selectView addSubview:lable];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(ZCQWidth - 150, 0, 130, 50)];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"更多信息反馈"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [button setAttributedTitle:str forState:UIControlStateNormal];
    [_selectView addSubview:button];
    
    [button addTarget:self action:@selector(buClick) forControlEvents:UIControlEventTouchUpInside];
    
    int t = 0;
    for (int i = 0; i < 2; i++ ) {
        for (int j = 0; j< 3; j++) {
            UIButton *selectBu = [[UIButton alloc]initWithFrame:CGRectMake( j * (ZCQWidth-20)/3 + 5 , i*50 +70, (ZCQWidth-40)/3, 40)];
            selectBu.layer.cornerRadius = 5;
            selectBu.layer.borderWidth = 0.5;
            selectBu.layer.borderColor = [UIColor lightGrayColor].CGColor;
            [selectBu setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [selectBu setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
            if (selectBu.isSelected) {
                selectBu.backgroundColor = [UIColor orangeColor];
            }else{
                selectBu.backgroundColor = [UIColor whiteColor];
            }
            [selectBu setTitle:arr[t][@"title"] forState:UIControlStateNormal];
            [selectBu addTarget:self action:@selector(selectBuClick:) forControlEvents:UIControlEventTouchUpInside];
            [_selectView addSubview:selectBu];
            selectBu.tag = t;
            t++;
        }
    }
    UIButton *OkButton = [[UIButton alloc]initWithFrame:CGRectMake((ZCQWidth-20) / 2 - 40, 170, 70, 70)];
    OkButton.layer.cornerRadius = 35;
    OkButton.layer.borderWidth = 0.5;
    OkButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    [OkButton setTitle:@"确定" forState:UIControlStateNormal];
    [OkButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [OkButton addTarget:self action:@selector(okbutClick) forControlEvents:UIControlEventTouchUpInside];
    [_selectView addSubview:OkButton];
}

- (void)selectBuClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    NSLog(@"faegvrewg");
}

- (void)okbutClick
{
    NSLog(@"确定");
    [self dismissSelectView];
}
- (void)buClick
{
    NSLog(@"更多信息反馈");
}

- (void)showSlideMenuPanelWithSelectFrame:(CGRect)frame
{
    _backgroundView.hidden = NO;
    _selectView.hidden =  NO;
    //动画显示
//    [UIView animateWithDuration:0.1 animations:^{
        _selectView.frame = frame;
//    } completion:^(BOOL finished) {
//    }];
//    //将本身加在Window上
    [[[UIApplication sharedApplication]keyWindow]addSubview:self];
    
}

- (void)dismissSelectView
{
    [self dismissWithAnimation:YES];
}

- (void)dismissWithAnimation:(BOOL)animation {
    void (^completion)(void) = ^void(void) {
        [self removeFromSuperview];
    };
    if (animation) {
        [UIView animateWithDuration:0.3 animations:^{
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
//                _selectView.frame = CGRectMake(0, 0, 0, 0);
                _selectView.hidden = YES;
            } completion:^(BOOL finished) {
                completion();
            }];
        }];
    } else {
//        _selectView.frame = CGRectMake(0, self.frame.size.height/2, 200, 200);
        _selectView.hidden = YES;
        completion();
    }
}
@end
