//
//  BCLDayTimeRecordCollectionViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/28.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLDayTimeRecordCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *dayOfTimeLabel;
@property (nonatomic, strong) UILabel *sometimeCaloriesLabel;
@property (nonatomic, strong) UIButton *dayCancelButton;
@property (nonatomic, strong) UIImageView *dayFoodImageView;

@end
