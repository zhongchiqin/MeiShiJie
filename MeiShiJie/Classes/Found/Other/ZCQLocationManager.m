//
//  ZCQLocationManager.m
//  LocationManager
//
//  Created by 钟炽琴 on 16/7/24.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import "ZCQLocationManager.h"
#import <CoreLocation/CoreLocation.h>

@implementation ZCQLocationManager

+(instancetype)shareLocationManager
{
    static ZCQLocationManager *LocationManager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LocationManager = [[ZCQLocationManager alloc]init];
        [LocationManager initCLLocationManager];
        
    });
    return LocationManager;

}
- (void)initCLLocationManager
{
    //如果系统支持定位服务
    if([CLLocationManager locationServicesEnabled]==YES){
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager startUpdatingLocation];//开启定位
        //授权
        [_locationManager requestWhenInUseAuthorization];
        
        _locationManager.delegate = self;//设置代理
        //定位精度
        _locationManager.desiredAccuracy =kCLLocationAccuracyBest;
        
        //距离过滤，单位米，经过指定距离通知位置变化
        _locationManager.distanceFilter = 100.f;
    }else{
        NSLog(@"系统不支持定位服务");
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *lastPoint = locations.lastObject;
    _coordinate = lastPoint.coordinate;
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    [geocoder reverseGeocodeLocation:lastPoint completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        for (CLPlacemark *mark in placemarks) {
            NSString * addressName = mark.name;
//            NSString * street = mark.thoroughfare;
//            NSString *str = mark.locality;
            if ([_delegate respondsToSelector:@selector(locationManager:didGetLocation:didGetAddress:)]) {
                [_delegate locationManager:self didGetLocation:_coordinate didGetAddress:addressName];
            }
        }
    }];
}
- (void)startLocation
{
    [_locationManager startUpdatingLocation];
}
- (void)stopLocation
{
    [_locationManager stopUpdatingLocation];
}

@end
