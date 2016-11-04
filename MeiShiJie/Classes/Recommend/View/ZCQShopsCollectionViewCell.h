//
//  ZCQShopsCollectionViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCQShopColectionModel.h"

@interface ZCQShopsCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *guige;

- (void)creatShopCellWithModel:(ZCQShopColectionModel *)model;

@end
