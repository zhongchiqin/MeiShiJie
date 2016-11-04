//
//  ZCQLikeTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQLikeTableViewCell.h"
#import "ZCQLikeModel.h"
#import "ZCQLikeDataModel.h"
#import "MJExtension.h"
#import "ZCQLikeCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@interface ZCQLikeTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)UILabel *lable;
@property(nonatomic, strong)UILabel *timeLable;
@property(nonatomic, strong)UICollectionView *collectionView;

@property(nonnull, strong)NSMutableArray *dataArray;

@property(nonatomic, strong)UILabel *bottomLable;
@property(nonatomic, strong)UIButton *bottombutton;
@end

@implementation ZCQLikeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    _lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, ZCQWidth, 30)];
    _lable.textAlignment = NSTextAlignmentCenter;
    _lable.font = [UIFont systemFontOfSize:20];
    _timeLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 35, ZCQWidth, 20)];
    _timeLable.textAlignment = NSTextAlignmentCenter;
    _timeLable.font = [UIFont systemFontOfSize:13];
    _timeLable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_lable];
    [self.contentView addSubview:_timeLable];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 55, ZCQWidth, 180 * 20) collectionViewLayout:flowLayout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.scrollEnabled = NO;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_collectionView];
    [_collectionView registerNib:[UINib nibWithNibName:@"ZCQLikeCollectionViewCell" bundle:[NSBundle  mainBundle]] forCellWithReuseIdentifier:@"celll"];
    
    _bottomLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 180 +55 , ZCQWidth, 20)];
    _bottomLable.text = @"藏在这儿都被你发现了？不感兴趣？";
    _bottomLable.font = [UIFont systemFontOfSize:15];
    _bottomLable.textAlignment = NSTextAlignmentCenter;
    _bottombutton = [[UIButton alloc]initWithFrame:CGRectMake((ZCQWidth - 80)/2, 180  +55 +30, 80, 20)];
    [_bottombutton setTitle:@"说说为啥" forState:UIControlStateNormal];
    [_bottombutton setTitleColor:MeiShiJieColor forState:UIControlStateNormal];
    _bottombutton.layer.cornerRadius = 5;
    _bottombutton.layer.borderWidth = 1;
    _bottombutton.layer.borderColor = MeiShiJieColor.CGColor;
    _bottombutton.titleLabel.font = [UIFont systemFontOfSize:13];
    [_bottombutton addTarget:self action:@selector(buttom:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_bottomLable];
    [self.contentView addSubview:_bottombutton];
    
}
- (void)buttom:(UIButton *)sender
{
    NSLog(@"说说为啥");
}
- (void)creatLikeCellWithDict:(NSDictionary *)dict
{
    ZCQLikeModel *model = [ZCQLikeModel likeWithDict:dict[@"customized"]];
    _lable.text = model.title;
    _timeLable.text = model.time;
    NSArray *arr= [ZCQLikeDataModel mj_objectArrayWithKeyValuesArray:model.data];
    _dataArray = [NSMutableArray arrayWithArray:arr];
     _bottomLable.frame = CGRectMake(0, 180 *(_dataArray.count/2) +55 , ZCQWidth, 20);
     _bottombutton.frame = CGRectMake((ZCQWidth - 80)/2, 180 *(_dataArray.count/2) +55 +30 , 80, 20);
    [_collectionView reloadData];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return _dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCQLikeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"celll" forIndexPath:indexPath];
    ZCQLikeDataModel *data = _dataArray[indexPath.row];
    [cell.titleImageView sd_setImageWithURL:[NSURL URLWithString:data.titlepic]];
    cell.titleLable.text = data.title;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}

// 设置cell的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ZCQWidth - 30) /2, (180 *20 - 21*10)/20);
}



@end
