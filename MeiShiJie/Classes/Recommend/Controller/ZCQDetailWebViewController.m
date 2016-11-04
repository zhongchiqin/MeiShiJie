//
//  ZCQDetailWebViewController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQDetailWebViewController.h"

@interface ZCQDetailWebViewController ()

@property(nonatomic, strong)UIWebView *webView;

@end

@implementation ZCQDetailWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpUI];
    [self creatWebView];
}

- (void)setUpUI
{

}
- (void)creatWebView
{

    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, ZCQWidth, ZCQHeigth - 64)];
    _webView.scrollView.bounces = NO;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.meishij.net/huodong/20160729_supor_index2.php"]];
    [_webView loadRequest:request];
    [self.view addSubview:_webView];
}

@end
