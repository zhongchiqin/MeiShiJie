//
//  ZCQHotSearchTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/14.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQHotSearchTableViewCell.h"
#import "ZCQHotWordsCollectionViewCell.h"

static NSString *const identifier = @"ZCQHotSearchTableViewCell";

@interface ZCQHotSearchTableViewCell ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *collectionView;


@end

@implementation ZCQHotSearchTableViewCell

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
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 200, 40)];
    lable.text = @"  热门搜索";
    lable.font = [UIFont systemFontOfSize:20];
    lable.textColor = [UIColor lightGrayColor];
    [self.contentView addSubview:lable];
  
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 43, ZCQWidth, 80)collectionViewLayout:flowLayout];
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.contentView addSubview:_collectionView];
    [_collectionView registerClass:[ZCQHotWordsCollectionViewCell class] forCellWithReuseIdentifier:identifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

// 设置cell的宽高
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCQHotWordsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell creatLableWithWordsWithHotWords:_dataArray[indexPath.row][@"t"]];
    cell.layer.cornerRadius = 2;
    cell.layer.borderWidth = 0.3;
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    return cell;
}

// 设置cell的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 50);
}



@end
