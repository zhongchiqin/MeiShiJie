//
//  ZCQLocationManager.h
//  LocationManager
//
//  Created by 钟炽琴 on 16/7/24.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class ZCQLocationManager;

@protocol ZCQLocationManagerDelegate <NSObject>

@optional
- (void)locationManager:(ZCQLocationManager *)manager didGetLocation:(CLLocationCoordinate2D)coordinate didGetAddress:(NSString *)address;
@end

@interface ZCQLocationManager : NSObject<CLLocationManagerDelegate>

@property(nonatomic, strong)CLLocationManager *locationManager;

@property(nonatomic, assign)CLLocationCoordinate2D coordinate;

@property(nonatomic, assign)id<ZCQLocationManagerDelegate>delegate;

+(instancetype)shareLocationManager;
- (void)startLocation;
- (void)stopLocation;
@end
