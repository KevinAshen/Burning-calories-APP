//
//  BCLSportsDietaryRecordDietaryTableViewSectionView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/2/13.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordDietaryTableViewSectionView.h"
#import <Masonry.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kViewLeftOrRightInterval = 170;
static const NSInteger kViewTopInterval = 10;

@interface BCLSportsDietaryRecordDietaryTableViewSectionView ()


@end

@implementation BCLSportsDietaryRecordDietaryTableViewSectionView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    self.backgroundColor = [UIColor clearColor];
    [self setupMealButton];
}

#pragma mark - mealButton设置
- (void)setupMealButton {
    self.mealButton = [[UIButton alloc] init];
    [self addSubview:_mealButton];
    
    [_mealButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
        make.top.equalTo(self.mas_top).offset(kViewTopInterval);
        make.center.equalTo(self);
    }];
    
    [_mealButton setBackgroundColor:[UIColor whiteColor]];
    [_mealButton setTitle:@"早" forState:UIControlStateNormal];
    [_mealButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_mealButton setImage:[UIImage imageNamed:@"bcl_ic_Dietary_tableView_sectionSetting"] forState:UIControlStateNormal];
    _mealButton.layer.masksToBounds = YES;
    _mealButton.layer.cornerRadius = 10;
    
    CGFloat imgWidth = _mealButton.imageView.bounds.size.width;
    CGFloat labWidth = _mealButton.titleLabel.bounds.size.width;
    [_mealButton setImageEdgeInsets:UIEdgeInsetsMake(0, labWidth, 0, -labWidth)];
    [_mealButton setTitleEdgeInsets:UIEdgeInsetsMake(0, -imgWidth, 0, imgWidth)];
}

@end
