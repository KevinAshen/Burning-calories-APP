//
//  BCLMonthOfDayRecordCollectionViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/3.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMonthOfDayRecordCollectionViewCell.h"
#import <Masonry.h>

static const CGFloat kMagrinMonth = 8;
@implementation BCLMonthOfDayRecordCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.monthOfDayFoodImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:_monthOfDayFoodImageView];
        [_monthOfDayFoodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kMagrinMonth);
            make.top.equalTo(self).offset(kMagrinMonth);
            make.width.mas_lessThanOrEqualTo(@116);
            make.height.mas_equalTo(103);
        }];
        
        self.monthOfDayTimeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_monthOfDayTimeLabel];
        [_monthOfDayTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.monthOfDayFoodImageView.mas_left);
            make.top.equalTo(self.monthOfDayFoodImageView.mas_bottom).offset(kMagrinMonth);
            
            make.width.mas_lessThanOrEqualTo(@60);
            make.height.mas_equalTo(25);
        }];
        _monthOfDayTimeLabel.font = [UIFont systemFontOfSize:18];
        
        self.monthOfDayCaloriesLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_monthOfDayCaloriesLabel];
        [_monthOfDayCaloriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-kMagrinMonth);
            make.top.equalTo(self.monthOfDayFoodImageView.mas_bottom).offset(kMagrinMonth);
            make.width.mas_lessThanOrEqualTo(@80);
            make.height.mas_equalTo(20);
        }];
        _monthOfDayCaloriesLabel.font = [UIFont systemFontOfSize:14];
        _monthOfDayCaloriesLabel.textColor = [UIColor lightGrayColor];
    }
    return self;
}
@end
