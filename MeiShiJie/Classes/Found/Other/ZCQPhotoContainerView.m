//
//  ZCQPhotoContainerView.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/31.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQPhotoContainerView.h"
#import <UIView+MJExtension.h>
#import "ZCQImageModel.h"
#import "UIImageView+WebCache.h"
#import "UIImage+WebP.h"
#import "MJExtension.h"

static CGFloat const margin = 8.f;

@interface ZCQPhotoContainerView()

@property(nonatomic, strong)NSArray *imageViewArray;

@end


@implementation ZCQPhotoContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i = 0; i < 9; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        [self addSubview:imageView];
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        [array addObject:imageView];
    }
    self.imageViewArray = [array copy];
}


- (void)setPicPathUrlArray:(NSArray *)picPathUrlArray
{
    _picPathUrlArray = picPathUrlArray;
    for (NSInteger i = _picPathUrlArray.count; i < self.imageViewArray.count; i++) {
        UIImageView *imageView = [self.imageViewArray objectAtIndex:i];
        imageView.hidden = YES;
    }
    if (_picPathUrlArray.count == 0) {
        self.mj_h =0;
        return;
    }
    
    CGFloat itemW = [self itemWidthForPicPathArray:_picPathUrlArray];
    CGFloat itemH = 0;
     NSArray *dataarray = [ZCQImageModel mj_objectArrayWithKeyValuesArray:_picPathUrlArray];
    if (_picPathUrlArray.count == 1) {
         ZCQImageModel *model = dataarray[0];
        if (model.width) {
            itemH = model.height/ model.width * itemW;
        }
    } else {
        itemH = itemW;
    }
    
    long perRowItemCount = [self perRowItemCountForPicPathArray:_picPathUrlArray];
    CGFloat margin = 5;

   
    
    [_picPathUrlArray enumerateObjectsUsingBlock:^(NSURL *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        ZCQImageModel *model = dataarray[idx];
        long columnIndex = idx % perRowItemCount;
        long rowIndex = idx / perRowItemCount;
        UIImageView *imageView = [_imageViewArray objectAtIndex:idx];
        imageView.hidden = NO;
//        dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//        if (model.imagePic) {
//            imageView.image = model.imagePic;
//        }else{
//            dispatch_async(globalQueue, ^{
//            NSData *data  = [[NSData alloc]initWithContentsOfURL:model.small];
//            UIImage *img = [UIImage imageWithWebPData:data];
//            model.imagePic = img;
//            dispatch_sync(dispatch_get_main_queue(), ^{
//                [imageView setImage:img];
//            });
//        });
//        }
//        [imageView setImage:model.imagePic];
        [imageView sd_setImageWithURL:model.small];
        imageView.frame = CGRectMake(columnIndex * (itemW + margin), rowIndex * (itemH + margin), itemW, itemH);
    }];
    
    CGFloat w = perRowItemCount * itemW + (perRowItemCount - 1) * margin;
    int columnCount = ceilf(_picPathUrlArray.count * 1.0 / perRowItemCount);
    CGFloat h = columnCount * itemH + (columnCount - 1) * margin;
    self.mj_w = w;
    self.mj_h = h;
}

- (CGFloat)itemWidthForPicPathArray:(NSArray *)array
{
    CGFloat contentW = [UIScreen mainScreen].bounds.size.width - 2 * margin; // 屏幕宽度减去左右间距
    ZCQImageModel *model = [ZCQImageModel dataWithDict:array[0]];
    if (array.count == 1) {
        
        if (model.width > contentW) {
            return  contentW;
        }else{
            return model.width;
        }
        
    } else {
       
        CGFloat w = contentW / 4;
        return w;
    }
}

- (NSInteger)perRowItemCountForPicPathArray:(NSArray *)array
{
    if (array.count < 3) {
        return array.count;
    } else if (array.count <= 4) {
        return 2;
    } else {
        return 3;
    }
}
@end
