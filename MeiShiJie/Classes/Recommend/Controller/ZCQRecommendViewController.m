//
//  ZCQRecommendViewController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQRecommendViewController.h"
#import <SDCycleScrollView.h>
#import "ZCQRequest.h"
#import "ZCQHeaderView.h"

@interface ZCQRecommendViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    
}

@property (nonatomic, strong) ZCQHeaderView * headerView;
@end

@implementation ZCQRecommendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatData];
    [self creatTableView];
    //    NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}
- (void)creatData
{
    //    _dict = [[NSMutableDictionary alloc]init];
    [ZCQRequest requestPostWithUrl:Recommend1_URL Parameters:nil Complete:^(NSData *data) {
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //        _dict = dict;
        
        //        NSLog(@"====%@",dict[@"obj"]);
        
        [_tableView reloadData];
        [self reloadHeaderView:dict[@"obj"]];
    } Fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (ZCQHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[ZCQHeaderView alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, 630+90)];
    }
    return _headerView;
}
//刷新头视图数据
- (void)reloadHeaderView:(NSDictionary *)dict
{
    //    NSLog(@"================%@",dict[@"san_can_titles"]);
    self.headerView.dict = dict;
}



- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ZCQWidth, ZCQHeigth-64)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor orangeColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  50;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = self.headerView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    cell.backgroundColor = [UIColor blueColor];
    return cell;
}

@end
