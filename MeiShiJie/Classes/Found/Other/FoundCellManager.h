//
//  FoundCellManager.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCQFaxian_listModel.h"

extern NSString * const kTemplate1CellID;
extern NSString * const kTemplate2CellID;
extern NSString * const kTemplate3CellID;
extern NSString * const kTemplate4CellID;
extern NSString * const kTemplate5CellID;
extern NSString * const kTemplate6CellID;
extern NSString * const kTemplate7CellID;
extern NSString * const kTemplate8CellID;
extern NSString * const kTemplate9CellID;
extern NSString * const kTemplate10CellID;
extern NSString * const kTemplate11CellID;
extern NSString * const kTemplate12CellID;
extern NSString * const kTemplate13CellID;
extern NSString * const kTemplate14CellID;
extern NSString * const kTemplate15CellID;
extern NSString * const kTemplate16CellID;
extern NSString * const kFirstCellID;
extern NSString * const kSecondCellID;

@interface FoundCellManager : NSObject



+ (CGFloat)heightOfListType:(NSInteger)type Model:(ZCQFaxian_listModel *)moodel;

+ (NSString *)cellIDOfListType:(NSInteger)type;

+ (UITableViewCell *)cellOfCellID:(NSString *)cellID
                    withTableView:(UITableView *)tableView
                        withModel:(ZCQFaxian_listModel *)modeldd
                    withIndexPath:(NSIndexPath *)indexPath;

@end
