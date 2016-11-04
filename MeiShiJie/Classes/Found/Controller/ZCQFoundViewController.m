//
//  ZCQFoundViewController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQFoundViewController.h"
#import "ZCQRequest.h"
#import "ZCQFoundModel.h"
#import "ZCQFaxian_listModel.h"
#import "FoundCellManager.h"
#import "MJRefresh.h"
#import "ZCQRefershHeader.h"
#import "ZCQLocationManager.h"

#import "ZCQRecipe1TableViewCell.h"
#import "ZCQShicai2TableViewCell.h"
#import "ZCQHUodong3TableViewCell.h"
#import "ZCQGongyi6TableViewCell.h"
#import "ZCQCaidan7TableViewCell.h"
#import "ZCQZt9TableViewCell.h"
#import "ZCQTopic11TableViewCell.h"
#import "ZCQVideo12TableViewCell.h"
#import "ZCQDuanzi15TableViewCell.h"
#import "ZCQDuanzi15_ImageTableViewCell.h"
#import "ZCQWechat16TableViewCell.h"

#import "ZFPlayer.h"
#import <MJExtension.h>

@interface ZCQFoundViewController ()<UITableViewDelegate, UITableViewDataSource,ZCQLocationManagerDelegate>

@property(nonatomic, strong)UITableView *tableView;

@property(nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong) ZFPlayerView   *playerView;

@end

@implementation ZCQFoundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setUpUI];
}
- (NSArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSArray array]init];
    }
    return _dataArray;
}

- (void)creatData
{

    [[ZCQLocationManager shareLocationManager]startLocation];
    [ZCQLocationManager shareLocationManager].delegate = self;
   
    

}

- (void)locationManager:(ZCQLocationManager *)manager didGetLocation:(CLLocationCoordinate2D)coordinate didGetAddress:(NSString *)address
{
    NSLog(@"%f,%f",coordinate.latitude,coordinate.longitude);
    NSLog(@"address:%@",address);
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[NSString stringWithFormat:@"%f",coordinate.latitude] forKeyedSubscript:@"lat"];
    [dict setObject:[NSString stringWithFormat:@"%f",coordinate.longitude] forKeyedSubscript:@"lon"];
    [dict setObject:@"json" forKeyedSubscript:@"format"];
    [dict setObject:@"iphone" forKeyedSubscript:@"source"];
    [ZCQRequest requestPostWithUrl:Found_URL Parameters:dict Complete:^(NSData *data) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        ZCQFoundModel *model = [ZCQFoundModel dateWithDict:dic];
        self.dataArray  = [ZCQFaxian_listModel  mj_objectArrayWithKeyValuesArray:model.faxian_list];
        //        self.dataArray = model.faxian_list;
        [_tableView reloadData];
        NSLog(@"%@",model.faxian_list);
        [_tableView.mj_header endRefreshing];
    } Fail:^(NSError *error) {
        [_tableView.mj_header endRefreshing];
    }];
//    [[ZCQLocationManager shareLocationManager]stopLocation];
    
}
- (void)setUpUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, ZCQHeigth - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    self.tableView.mj_header = [ZCQRefershHeader headerWithRefreshingBlock:^{
        [self creatData];
    }];
    [self.tableView.mj_header beginRefreshing];

    [_tableView registerNib:[UINib nibWithNibName:@"ZCQRecipe1TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate1CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQShicai2TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate2CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQHUodong3TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate3CellID];
     [_tableView registerNib:[UINib nibWithNibName:@"ZCQGongyi6TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate6CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQCaidan7TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate7CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQZt9TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate9CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQTopic11TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate11CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQVideo12TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate12CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQDuanzi15TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate15CellID];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQDuanzi15_ImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZCQDuanzi15_ImageTableViewCell.h"];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQWechat16TableViewCell" bundle:nil] forCellReuseIdentifier:kTemplate16CellID];
   
}

#pragma mark ------TableView dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCQFaxian_listModel *model = _dataArray[indexPath.row];
    if (model.type == 15) {
        if (model.duanzi_info.media_type == 1) {
            ZCQDuanzi15_ImageTableViewCell *cell = (ZCQDuanzi15_ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ZCQDuanzi15_ImageTableViewCell.h"];
            return [cell cellHeightWithModel:model.duanzi_info];
        }else{
          return  [FoundCellManager heightOfListType:model.type Model:model] ;
        }
    }else if(model.type == 11){
        ZCQTopic11TableViewCell *cell = (ZCQTopic11TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate11CellID];
        return [cell cellHeightWithModel:model.topic_info];
    
    }
    return [FoundCellManager heightOfListType:model.type Model:model] + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZCQFaxian_listModel *model = _dataArray[indexPath.row];
    NSString *cellID = [FoundCellManager cellIDOfListType:model.type];
    
    if ([cellID isEqualToString:kTemplate15CellID]) {
        if (model.duanzi_info.media_type == 1) {
            ZCQDuanzi15_ImageTableViewCell *cell = (ZCQDuanzi15_ImageTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"ZCQDuanzi15_ImageTableViewCell.h"];
            [cell setCellWIthModel:model.duanzi_info];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
            return cell;
        }else{
            ZCQDuanzi15TableViewCell *cell = (ZCQDuanzi15TableViewCell *)[tableView dequeueReusableCellWithIdentifier:kTemplate15CellID];
            [cell setCellWIthModel:model.duanzi_info];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.contentView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
            
        // 点击播放的回调
        __block NSIndexPath *weakIndexPath = indexPath;
        __block ZCQDuanzi15TableViewCell *weakCell     = cell;
        __weak typeof(self) weakSelf       = self;
        
        cell.playBlock = ^(UIButton *btn){
            weakSelf.playerView = [ZFPlayerView sharedPlayerView];
//            NSURL *videoURL     = [NSURL URLWithString:model.duanzi_info.vurl];
            // 设置player相关参数(需要设置imageView的tag值，此处设置的为101)
            [weakSelf.playerView setVideoURL:model.duanzi_info.vurl
                               withTableView:weakSelf.tableView
                                 AtIndexPath:weakIndexPath
                            withImageViewTag:101];
            [weakSelf.playerView addPlayerToCellImageView:weakCell.sourceView
             ];
            //（可选设置）可以设置视频的填充模式，默认为（等比例填充，直到一个维度到达区域边界）
            weakSelf.playerView.playerLayerGravity = ZFPlayerLayerGravityResizeAspect;
//            [weakSelf.playerView play];
        };
        return cell;
        }
    }else{
        
    UITableViewCell *cell = [FoundCellManager cellOfCellID:cellID withTableView:tableView withModel:model withIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.contentView.backgroundColor = [UIColor colorWithRed:0.97f green:0.97f blue:0.97f alpha:1.00f];
        return cell;
    }
}

// 页面消失时候
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.playerView resetPlayer];
}
@end
