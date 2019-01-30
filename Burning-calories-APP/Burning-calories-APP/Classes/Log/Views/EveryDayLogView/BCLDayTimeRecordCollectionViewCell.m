//
//  BCLDayTimeRecordCollectionViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/28.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLDayTimeRecordCollectionViewCell.h"
#import <Masonry.h>
static const CGFloat kLeftDayTimeMargin = 10;
static const CGFloat kTopDayTimeMargin = 50;
static const CGFloat kSideDayTimeLength = 100;

@implementation BCLDayTimeRecordCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _backgroundImageView = [[UIImageView alloc]init];
        [self addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            //make.left.equalTo(self).offset(kLeftDayTimeMargin);
            make.top.equalTo(self).offset(kTopDayTimeMargin);
            make.width.mas_equalTo(3 * kSideDayTimeLength);
            make.height.mas_equalTo(2 * kSideDayTimeLength);

        }];
        _backgroundImageView.center = self.contentView.center;
        _backgroundImageView.image = [UIImage imageNamed:@"bcl_bg_log_everyday"];
        
        self.dayOfTimeLabel = [[UILabel alloc]init];
        [self addSubview:_dayOfTimeLabel];
        [_dayOfTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kLeftDayTimeMargin);
            make.top.equalTo(self.backgroundImageView.mas_top).offset(kLeftDayTimeMargin);
            make.width.mas_equalTo(80);
            make.height.mas_equalTo(20);
        }];
        _dayOfTimeLabel.font = [UIFont systemFontOfSize:14];
        
        self.sometimeCaloriesLabel = [[UILabel alloc]init];
        [self addSubview:_sometimeCaloriesLabel];
        [_sometimeCaloriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dayOfTimeLabel.mas_right).offset(140);
            make.top.equalTo(self.dayOfTimeLabel.mas_top);
            make.width.mas_lessThanOrEqualTo(@50);
            make.height.mas_equalTo(17);
        }];
        _sometimeCaloriesLabel.textColor = [UIColor colorWithRed:0.79f green:0.79f blue:0.79f alpha:1.00f];
        _sometimeCaloriesLabel.font = [UIFont systemFontOfSize:12];
        _sometimeCaloriesLabel.text = @"207千卡";
        
        _dayCancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_dayCancelButton];
        [_dayCancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.sometimeCaloriesLabel.mas_right).offset(kLeftDayTimeMargin / 2);
            make.top.equalTo(self.sometimeCaloriesLabel.mas_top);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [_dayCancelButton setImage:[UIImage imageNamed:@"bcl_btn_log_everyday_cancel"] forState:UIControlStateNormal];
        
        _dayFoodImageView = [[UIImageView alloc] init];
        [self addSubview:_dayFoodImageView];
        [_dayFoodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dayOfTimeLabel.mas_left);
            make.top.equalTo(self.dayOfTimeLabel.mas_bottom).offset(kLeftDayTimeMargin / 2);
            make.width.mas_equalTo(282);
            make.height.mas_equalTo(156);
        }];
    }
    return self;
}
- (void)reloadCollectionViewCellWithData {
    
    
}
@end
