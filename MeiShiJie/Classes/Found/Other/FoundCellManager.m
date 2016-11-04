//
//  FoundCellManager.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "FoundCellManager.h"
#import "ZCQRecipe_info1Model.h"
#import "ZCQShicai_info2Model.h"
#import "ZCQHuodong3Model.h"
#import "ZCQGoods_info4.h"
#import "ZCQArticle_info5Model.h"
#import "ZCQGongyi_info6Model.h"
#import "ZCQCaidan_info7Model.h"
#import "ZCQZt_info9Model.h"
#import "ZCQTopic_info11Model.h"
#import "ZCQVideo_list12Model.h"
#import "ZCQDuanzi_info15Model.h"
#import "ZCQWechat_info16Model.h"

#import "ZCQRecipe1TableViewCell.h"
#import "ZCQShicai2TableViewCell.h"
#import "ZCQHUodong3TableViewCell.h"
#import "ZCQGongyi6TableViewCell.h"
#import "ZCQCaidan7TableViewCell.h"
#import "ZCQZt9TableViewCell.h"
#import "ZCQTopic11TableViewCell.h"
#import "ZCQVideo12TableViewCell.h"
#import "ZCQDuanzi15TableViewCell.h"
#import "ZCQWechat16TableViewCell.h"

static CGFloat const kTemplate1CellHeight = 130;
static CGFloat const kTemplate2CellHeight = 130;
static CGFloat const kTemplate3CellHeight = 200;
static CGFloat const kTemplate4CellHeight = 200;
static CGFloat const kTemplate5CellHeight = 200;
static CGFloat const kTemplate6CellHeight = 200;
static CGFloat const kTemplate7CellHeight = 200;
static CGFloat const kTemplate8CellHeight = 200;
static CGFloat const kTemplate9CellHeight = 210;
static CGFloat const kTemplate10CellHeight = 200;
static CGFloat const kTemplate11CellHeight = 200;
static CGFloat const kTemplate12CellHeight = 200;
static CGFloat const kTemplate13CellHeight = 200;
static CGFloat const kTemplate14CellHeight = 200;
//static CGFloat const kTemplate15CellHeight = 200;
static CGFloat const kTemplate16CellHeight = 90;


NSString * const kTemplate1CellID = @"kTemplate1CellID";
NSString * const kTemplate2CellID = @"kTemplate2CellID";
NSString * const kTemplate3CellID = @"kTemplate3CellID";
NSString * const kTemplate4CellID = @"kTemplate4CellID";
NSString * const kTemplate5CellID = @"kTemplate5CellID";
NSString * const kTemplate6CellID = @"kTemplate6CellID";
NSString * const kTemplate7CellID = @"kTemplate7CellID";
NSString * const kTemplate8CellID = @"kTemplate8CellID";
NSString * const kTemplate9CellID = @"kTemplate9CellID";
NSString * const kTemplate10CellID = @"kTemplate10CellID";
NSString * const kTemplate11CellID = @"kTemplate11CellID";
NSString * const kTemplate12CellID = @"kTemplate12CellID";
NSString * const kTemplate13CellID = @"kTemplate13CellID";
NSString * const kTemplate14CellID = @"kTemplate14CellID";
NSString * const kTemplate15CellID = @"kTemplate15CellID";
NSString * const kTemplate16CellID = @"kTemplate16CellID";



NSString * const kFirstCellID = @"kFirstCellID";
NSString * const kSecondCellID = @"kSecondCellID";

@implementation FoundCellManager

+ (CGFloat)heightOfListType:(NSInteger)type Model:(ZCQFaxian_listModel *)moodel
{
    switch (type) {
        case 1:
            return kTemplate1CellHeight;
            break;
        case 2:
            return kTemplate2CellHeight;
            break;
        case 3:
            return kTemplate3CellHeight;
            break;
        case 4:
            return kTemplate4CellHeight;
            break;
        case 5:
            return kTemplate5CellHeight;
            break;
        case 6:
            return kTemplate6CellHeight;
            break;
        case 7:
            return kTemplate7CellHeight;
            break;
        case 8:
            return kTemplate8CellHeight;
            break;
        case 9:
            return kTemplate9CellHeight;
            break;
        case 10:
            return kTemplate10CellHeight;
            break;
        case 11:
            return kTemplate11CellHeight;
            break;
        case 12:
            return kTemplate12CellHeight;
            break;
        case 13:
            return kTemplate13CellHeight;
            break;
        case 14:
            return kTemplate14CellHeight;
            break;
        case 15:{
            ZCQDuanzi_info15Model *model5 = moodel.duanzi_info;
            return model5.cellHeigth;
        }
            break;
        case 16:
            return kTemplate16CellHeight;
            break;
            
        default:
            return 0;
            break;
    }
}

+ (NSString *)cellIDOfListType:(NSInteger)type
{
    switch (type) {
        case 1:
            return kTemplate1CellID;
            break;
        case 2:
            return kTemplate2CellID;
            break;
        case 3:
            return kTemplate3CellID;
            break;
        case 4:
            return kTemplate4CellID;
            break;
        case 5:
            return kTemplate5CellID;
            break;
        case 6:
            return kTemplate6CellID;
            break;
        case 7:
            return kTemplate7CellID;
            break;
        case 8:
            return kTemplate8CellID;
            break;
        case 9:
            return kTemplate9CellID;
            break;
        case 10:
            return kTemplate10CellID;
            break;
        case 11:
            return kTemplate11CellID;
            break;
        case 12:
            return kTemplate12CellID;
            break;
        case 13:
            return kTemplate13CellID;
            break;
        case 14:
            return kTemplate14CellID;
            break;
        case 15:
            
            return kTemplate15CellID;
            break;
        case 16:
            return kTemplate16CellID;
            break;
        default:
            return kTemplate1CellID;
            break;
    }

}

+ (UITableViewCell *)cellOfCellID:(NSString *)cellID
                    withTableView:(UITableView *)tableView
                         withModel:(ZCQFaxian_listModel *)modeldd
                    withIndexPath:(NSIndexPath *)indexPath
{
   
        if ([cellID isEqualToString: kTemplate1CellID]) {
            ZCQRecipe1TableViewCell *cell = (ZCQRecipe1TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            [cell setCellWithModel:modeldd];
            return cell;
        }else if ([cellID isEqualToString: kTemplate2CellID]) {
            ZCQShicai2TableViewCell *cell = (ZCQShicai2TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
            [cell setCellWithModel:modeldd];
            return cell;
        }else if ([cellID isEqualToString: kTemplate3CellID]) {
        ZCQHUodong3TableViewCell *cell = (ZCQHUodong3TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        [cell setCellWithModel:modeldd];
        return cell;
    }else if ([cellID isEqualToString: kTemplate4CellID]) {
            ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
            [cell setCellWithModel:modeldd.video_list];
            return cell;
        }else if ([cellID isEqualToString: kTemplate5CellID]) {
            ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
            [cell setCellWithModel:modeldd.video_list];
            return cell;
        }else if ([cellID isEqualToString: kTemplate6CellID]) {
        ZCQGongyi6TableViewCell *cell = (ZCQGongyi6TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate6CellID];
        [cell setCellWithModel:modeldd];
        return cell;
    }else if ([cellID isEqualToString: kTemplate7CellID]) {
        ZCQCaidan7TableViewCell *cell = (ZCQCaidan7TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate7CellID];
        [cell setCellWithModel:modeldd];
        return cell;
    }else if ([cellID isEqualToString: kTemplate8CellID]) {
        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }else if ([cellID isEqualToString: kTemplate9CellID]) {
        ZCQZt9TableViewCell *cell = (ZCQZt9TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate9CellID];
        [cell setCellWithModel:modeldd];
        return cell;
    }else if ([cellID isEqualToString: kTemplate10CellID]) {
        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }else if ([cellID isEqualToString: kTemplate11CellID]) {
        ZCQTopic11TableViewCell *cell = (ZCQTopic11TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate11CellID];
        [cell setCellWithModel:modeldd];
        return cell;
    }else if ([cellID isEqualToString: kTemplate12CellID]) {
        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }else if ([cellID isEqualToString: kTemplate13CellID]) {

        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }else if ([cellID isEqualToString: kTemplate14CellID]) {
        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }else if ([cellID isEqualToString: kTemplate15CellID]) {
        ZCQDuanzi15TableViewCell *cell = (ZCQDuanzi15TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        [cell setCellWIthModel:modeldd.duanzi_info];
        return cell;
    }else if ([cellID isEqualToString: kTemplate16CellID]) {
        ZCQWechat16TableViewCell *cell = (ZCQWechat16TableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
        [cell setCellWithModel:modeldd.wechat_info];
        return cell;
    }else{
        ZCQVideo12TableViewCell *cell = (ZCQVideo12TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate12CellID];
        [cell setCellWithModel:modeldd.video_list];
        return cell;
    }
    
    
    
}


@end
