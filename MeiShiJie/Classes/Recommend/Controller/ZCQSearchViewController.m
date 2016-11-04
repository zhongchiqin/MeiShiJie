//
//  ZCQSearchViewController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/6/12.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQSearchViewController.h"
#import "ZCQSearchTextField.h"
#import "ZCQHotSearchTableViewCell.h"
static NSString *const Identifier = @"ZCQSearchViewControlle";
static NSString *const Identifier2 = @"ZCQSearchViewControlle2";

@interface ZCQSearchViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)ZCQSearchTextField *search;
@property(nonatomic, strong)UITableView *tableView;
@end

@implementation ZCQSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpNav];
    [self setUpUI];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self.search becomeFirstResponder];

}
- (void)setUpNav
{
    _search = [[ZCQSearchTextField alloc]init];
    CGFloat w = ZCQWidth * 0.8;
    _search.frame = CGRectMake(0, 0, w, 30);
    _search.delegate = self;
    _search.placeholder = @"搜索你感兴趣的";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_search];
    
    //取消按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    [btn setTitleColor:MeiShiJieColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
}
- (void)backClick
{
    [self.search resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)setUpUI
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, ZCQHeigth - 64)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:Identifier];
    [_tableView registerClass:[ZCQHotSearchTableViewCell class] forCellReuseIdentifier:Identifier2];
    [self.view addSubview:_tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _hotArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ZCQHotSearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier2];
        tableView.rowHeight = 143;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.selected = NO;
//        [cell creatCellVithHotDataArray:_hotArray];
        cell.dataArray = _hotArray;
        return cell;
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
        tableView.rowHeight = 50;
        if (indexPath.row == 1) {
            cell.textLabel.text = @"历史记录";
            cell.textLabel.textColor = [UIColor lightGrayColor];
            
        }else{
            cell.textLabel.text = @"llllll";
            cell.textLabel.textColor = [UIColor blackColor];
        }
        return cell;
    }
}

@end

