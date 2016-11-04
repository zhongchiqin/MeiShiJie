//
//  ZCQFirstTableViewCell.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQFirstTableViewCell.h"
#import "SDCycleScrollView.h"
#import "ZCQTop3CellModel.h"
#import "ZCQShopsCollectionViewCell.h"
#import "ZCQShopColectionModel.h"


@interface ZCQFirstTableViewCell()<SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)SDCycleScrollView *scrollerView;
@property(nonatomic, strong)UICollectionView *collctionView;
@property(nonatomic, strong)NSDictionary *dict;
@property(nonatomic, strong)NSArray *arr;
@end
@implementation ZCQFirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpUI];
    }
    return self;
}

- (void)setUpUI
{
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, 30)];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"最热商品";
    lable.font = [UIFont systemFontOfSize:20];
    [self.contentView addSubview:lable];
    
    _scrollerView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(10, 30, ZCQWidth-20, 80) delegate:self placeholderImage:nil];
    _scrollerView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _scrollerView.currentPageDotColor = MeiShiJieColor;
    _scrollerView.autoScrollTimeInterval = 3;
    [self.contentView addSubview:_scrollerView];
//    
//    [_scrollerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(lable.mas_bottom).offset(0);
//        make.
//    }];
    
    
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    _collctionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 110, ZCQWidth, _arr.count/2 *250) collectionViewLayout:flowLayout];
    _collctionView.delegate = self;
    _collctionView.dataSource = self;
    [self.contentView addSubview:_collctionView];
    [_collctionView registerNib:[UINib nibWithNibName:@"ZCQShopsCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ZCQShopsCollectionViewCell"];
    _collctionView.backgroundColor = [UIColor whiteColor];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr  = [NSArray arrayWithArray:_dict[@"shops"]];
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZCQShopsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ZCQShopsCollectionViewCell" forIndexPath:indexPath];
    ZCQShopColectionModel *model = [ZCQShopColectionModel shopsWithDict:_dict[@"shops"][indexPath.row]];
    [cell creatShopCellWithModel:model];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
}

// 设置cell的宽高
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((ZCQWidth - 30) /2, (_arr.count/2 * 250- (_arr.count/2+1)*10 )/(_arr.count/2));
}

- (void)creatFirstCellWithDict:(NSDictionary *)dict
{
    _dict = dict;
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSDictionary *dic in dict[@"top3"]) {
            ZCQTop3CellModel *model = [ZCQTop3CellModel top3WithDict:dic];
        [array addObject:model.photo];
    }
     _scrollerView.imageURLStringsGroup = array;
   
     _arr  = [NSArray arrayWithArray:_dict[@"shops"]];
    _collctionView.frame = CGRectMake(0, 110, ZCQWidth, _arr.count/2 *250);
    [_collctionView reloadData];
   
}


/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"你点击了第%ld张",(long)index);
}
@end
