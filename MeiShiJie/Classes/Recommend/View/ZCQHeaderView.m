//
//  ZCQHeaderView.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//


#import "ZCQHeaderView.h"
#import "ZCQHeaderScrollerView.h"
#import "UIImageView+WebCache.h"
#import "ZCQCategoryModel.h"

@interface ZCQHeaderView ()
{
    UIView *_viewvv;
}

@property(nonatomic,strong)ZCQHeaderScrollerVIew *scorllerView;

@end
@implementation ZCQHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self creatHeaderViewWithDict:_dict];
        
    }
    return self;
}
-(ZCQHeaderScrollerVIew *)scorllerView
{
    if (!_scorllerView) {
        _scorllerView = [[ZCQHeaderScrollerVIew alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, 530)];
    }
    return _scorllerView;
}

-(void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    _scorllerView.dataArray = _dict[@"san_can"];
    _scorllerView.titleArray = _dict[@"san_can_titles"];
    [self creatHeaderViewWithDict:_dict];
    [self creatButtonWithArr:_dict[@"fenlei"]];
    [self creatTowButtonWithDict:_dict];
    
}
- (void)creatHeaderViewWithDict:(NSDictionary *)dict
{
    
    [self addSubview:self.scorllerView];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 470, ZCQWidth, 80)];
    imageView.image = [UIImage imageNamed:@"home_yuanhu"];
    [self addSubview:imageView];
    _viewvv = [[UIView alloc]initWithFrame:CGRectMake(0, 540, ZCQWidth, (ZCQWidth-125)/4 + 30 + 90)];
    _viewvv.backgroundColor = [UIColor whiteColor];
    [self addSubview:_viewvv];
    
}
- (void)creatButtonWithArr:(NSArray *)arr
{
    
    for (int i = 0; i < 4; i++) {
        ZCQCategoryModel *model = [ZCQCategoryModel categoryWithDict:arr[i]];
        NSLog(@"%@",model.title);
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake((ZCQWidth-125)/4 * i +25*(i+1), 0, (ZCQWidth-125)/4, (ZCQWidth-125)/4)];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.image]];
        UIImage *image = [UIImage imageWithData:data];
        [button setBackgroundImage:image forState:UIControlStateNormal];
        UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake((ZCQWidth-125)/4 * i +25*(i+1),(ZCQWidth-125)/4+5 ,(ZCQWidth-125)/4,15)];
        lable.text = model.title;
        lable.font = [UIFont systemFontOfSize:10];
        lable.textAlignment = NSTextAlignmentCenter;
        [_viewvv addSubview:lable];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_viewvv addSubview:button];
    }
    
}
- (void)creatTowButtonWithDict:(NSDictionary *)dict
{
    
    for (int i = 0; i < 2; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, (ZCQWidth - 30)/2, 85)];
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake((ZCQWidth-30)/2 * i +10*(i+1), (ZCQWidth-125)/4 + 25, (ZCQWidth - 30)/2, 85)];
        imageView.userInteractionEnabled = YES;
        if (i == 0) {
            [imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"func1"][@"image"]] placeholderImage:nil];
        }else{
            [imageView sd_setImageWithURL:[NSURL URLWithString:dict[@"func2"][@"image"]] placeholderImage:nil];
        }
        [_viewvv addSubview:imageView];
        [imageView addSubview:button];
        button.tag = i;
        [button addTarget:self action:@selector(buc:) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)buc:(UIButton *)bu
{
    switch (bu.tag) {
        case 0:
            NSLog(@"vapvrw");
            break;
        case 1:
            NSLog(@"222222");
            break;
        default:
            break;
    }
}
@end

