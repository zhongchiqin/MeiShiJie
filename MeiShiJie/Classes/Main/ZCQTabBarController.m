//
//  ZCQTabBarController.m
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/5/15.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQTabBarController.h"
#import "ZCQNavController.h"
@interface ZCQTabBarController ()

@end

@implementation ZCQTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.barTintColor = [UIColor whiteColor];
    self.tabBar.tintColor = MeiShiJieColor;
    [self creatTabBar];
    
}

- (void)creatTabBar{
    [self addController:@"ZCQRecommendViewControlle" WithTitle:@"推荐" NormalImageName:@"home_recipe~ipad" SelectImageName:@"home_reciped~ipad"];
    [self addController:@"ZCQFoundViewController" WithTitle:@"发现" NormalImageName:@"home_cd" SelectImageName:@"home_cded"];
    [self addController:@"ZCQShopViewController" WithTitle:@"商城" NormalImageName:@"home_menu" SelectImageName:@"home_menued"];
    [self addController:@"ZCQMessageViewController" WithTitle:@"食话" NormalImageName:@"home_rank" SelectImageName:@"home_ranked"];
    [self addController:@"ZCQMineViewController" WithTitle:@"我的" NormalImageName:@"home_user" SelectImageName:@"home_usered"];
}

- (void)addController:(NSString *)controllerName WithTitle:(NSString *)title NormalImageName:(NSString *)normalImageName SelectImageName:(NSString *)selectImageName
{
    Class class = NSClassFromString(controllerName);
    UIViewController *controller = [[class alloc]init];
    controller.title = title;
    UIImage *normalImage = [[UIImage imageNamed:normalImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectImage = [[UIImage imageNamed:selectImageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem = [[UITabBarItem alloc]initWithTitle:title image:normalImage selectedImage:selectImage];
    ZCQNavController *nav = [[ZCQNavController alloc]initWithRootViewController:controller];
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:self.viewControllers];
    [array addObject:nav];
    self.viewControllers = array;
    
}

@end
