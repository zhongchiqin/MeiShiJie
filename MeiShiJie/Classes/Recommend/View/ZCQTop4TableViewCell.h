//
//  ZCQTop4TableViewCell.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/16.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCQTop4TableViewCell : UITableViewCell
@property(nonatomic, strong)UIViewController *vc;

- (void)creatTop4:(NSDictionary *)dict;

@end
