//
//  ZCQStarView.h
//  MeiShiJie
//
//  Created by 钟炽琴 on 16/8/19.
//  Copyright © 2016年 钟炽琴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCQStarView : UIView {
	UIImageView *s1, *s2, *s3, *s4, *s5;
	UIImage *unselectedImage, *partlySelectedImage, *fullySelectedImage;
	float starRating, lastRating;
	float height, width; // of each image of the star!
}

@property (nonatomic, retain) UIImageView *s1;
@property (nonatomic, retain) UIImageView *s2;
@property (nonatomic, retain) UIImageView *s3;
@property (nonatomic, retain) UIImageView *s4;
@property (nonatomic, retain) UIImageView *s5;

-(void)setImagesDeselected:(NSString *)unselectedImage partlySelected:(NSString *)partlySelectedImage 
			  fullSelected:(NSString *)fullSelectedImage ;
-(void)displayRating:(float)rating;
-(float)rating;

@end
