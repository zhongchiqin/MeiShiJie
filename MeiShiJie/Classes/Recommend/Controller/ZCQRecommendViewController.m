//
//  ZCQRecommendViewController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQRecommendViewController.h"
#import "SDCycleScrollView.h"
#import "ZCQRequest.h"
#import "ZCQHeaderView.h"
#import "ZCQFirstTableViewCell.h"
#import "ZCQTodayTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "ZCQRecommendTableViewCell.h"
#import "ZCQTop4TableViewCell.h"
#import "ZCQLikeTableViewCell.h"
#import "ZCQSearchTextField.h"
#import "ZCQSearchViewController.h"
#import "ZCQMoreSelcetView.h"
#import "ZCQDetailWebViewController.h"


static NSString * const Identifier1 = @"Identifier1";
static NSString * const Identifier2 = @"Identifier2";
static NSString * const Identifier3 = @"Identifier3";
static NSString * const Identifier4 = @"Identifier4";
static NSString * const Identifier5 = @"Identifier5";
static NSString * const Identifier6 = @"Identifier6";

@interface ZCQRecommendViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    UITableView *_tableView;
    NSMutableDictionary *_dict;
    NSMutableDictionary *_likeDict;
    NSMutableDictionary *_editorDict;
    ZCQSearchTextField *_searchTextFiled;
}
@property(nonatomic, strong)ZCQMoreSelcetView *selectView;
@property (nonatomic, strong) ZCQHeaderView * headerView;
@end

@implementation ZCQRecommendViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatData];
    [self creatTableView];
    [self SetUpNav];
//        NSLog(@"%@",NSStringFromCGRect(self.view.frame));
}


- (void)creatData
{
    _dict = [[NSMutableDictionary alloc]init];
    _likeDict = [[NSMutableDictionary alloc]init];
    _editorDict = [[NSMutableDictionary alloc]init];
    [ZCQRequest requestPostWithUrl:Recommend1_URL Parameters:nil Complete:^(NSData *data) {
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _dict = dict[@"obj"];
//        NSLog(@"%@",_dict);
        [_tableView reloadData];
        [self reloadHeaderView:dict[@"obj"]];
    } Fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    [ZCQRequest requestGetWithUrl:Recommend2_URL Parameters:nil Complete:^(NSData *data) {
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        _likeDict = dict[@"obj"];
        [_tableView reloadData];
    } Fail:^(NSError *error) {
         NSLog(@"%@",error);
    }];
    
    
    [ZCQRequest requestGetWithUrl:Searc_url Parameters:nil Complete:^(NSData *data) {
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
//        NSLog(@"=========%@",dict);
        _editorDict = dict[@"obj"];
    } Fail:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

- (ZCQHeaderView *)headerView
{
    if (!_headerView) {
        _headerView = [[ZCQHeaderView alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, 630+100)];
    }
    

//        NSLog(@"========%@",NSStringFromCGRect(_tableView.tableHeaderView.frame));
    return _headerView;
}

//刷新头视图数据
- (void)reloadHeaderView:(NSDictionary *)dict
{
    self.headerView.dict = dict;

}

- (void)SetUpNav
{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"index_icon_photo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(leftBut)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"ms_mail2"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(rigthBut)];

    
    
    ZCQSearchTextField *search = [[ZCQSearchTextField alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth*0.8, 35)];
    search.placeholder = @"搜索你感兴趣的";
    search.delegate = self;
    _searchTextFiled = search;
    self.navigationItem.titleView = search;
    
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_searchTextFiled resignFirstResponder];
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    ZCQSearchViewController *searchVC = [[ZCQSearchViewController alloc]init];
    searchVC.hotArray = _editorDict[@"hot_words2"];
    [self.navigationController pushViewController:searchVC animated:YES];
    return YES;
}


- (void)leftBut
{

}
- (void)rigthBut
{

}
- (void)creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ZCQWidth, ZCQHeigth-64)];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight =  50;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self.view addSubview:_tableView];
    _tableView.tableHeaderView = self.headerView;
    [_tableView registerClass:[ZCQFirstTableViewCell class] forCellReuseIdentifier:Identifier1];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier2];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQRecommendTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier5];
    [_tableView registerClass:[ZCQTop4TableViewCell class] forCellReuseIdentifier:Identifier4];
    [_tableView registerClass:[ZCQLikeTableViewCell class] forCellReuseIdentifier:Identifier3];
    [_tableView registerNib:[UINib nibWithNibName:@"ZCQTodayTableViewCell" bundle:nil] forCellReuseIdentifier:Identifier6];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = _dict[@"zt"];
    NSInteger num = arr.count;
    return 3 + num;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *arr = _dict[@"zt"];
    NSInteger num = arr.count;
    
    if (indexPath.row == 0) {
        ZCQFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier1];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell creatFirstCellWithDict:_dict];
    return cell;
    }else if(indexPath.row == 1){
        ZCQTodayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier6];
        cell.controller = self.view;
        cell.dataarray = _editorDict[@"tags"][@"editor_recommend_index"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    }else if(indexPath.row == num +2){
        ZCQLikeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier3];
        [cell creatLikeCellWithDict:_likeDict];
        return cell;
    }
//    else if(indexPath.row == num + 2){
//        ZCQTop4TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier4];
//        cell.vc = self;
//        [cell creatTop4:_dict];
//        return cell;
//    }
    else{
        ZCQRecommendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier5];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.recommendImageView sd_setImageWithURL:[NSURL URLWithString:_dict[@"zt"][indexPath.row-2][@"photo"]]];

        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return [self countHeigthForRowHegthWithIndexpath:(NSIndexPath *)indexPath];
}

- (CGFloat)countHeigthForRowHegthWithIndexpath:(NSIndexPath *)indexPath
{
    NSArray *array = _dict[@"zt"];
    NSInteger num = array.count;
    if (indexPath.row == 0) {
        NSArray *arr  = [NSArray arrayWithArray:_dict[@"shops"]];
        return arr.count/2 * 250 + 110;
    }else if(indexPath.row == 1){
        return 40;
    }
//    else if(indexPath.row == num + 2){
//        return 90;
//    }
    else if(indexPath.row == num + 2){
        NSArray *likeArray = _likeDict[@"customized"][@"data"];
       
        return 180*(likeArray.count/2) + 55 +60;
    }else
        return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"你点击了第%ld个cell",(long)indexPath.row);
    NSArray *arr = _dict[@"zt"];
    NSInteger num = arr.count;
    
    if (indexPath.row == 0) {
       
    }else if(indexPath.row == 1){
        
    }else if(indexPath.row == num +3){
        
    }else if(indexPath.row == num + 2){
        ZCQDetailWebViewController * top4 = [[ZCQDetailWebViewController alloc]init];
        [self.navigationController pushViewController:top4 animated:YES];
        
        
    }else{
        
    }
}
@end
