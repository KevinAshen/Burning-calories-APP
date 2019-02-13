//
//  BCLMonthAllCaloriesCollectionViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/3.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMonthAllCaloriesCollectionViewCell.h"
#import <Masonry.h>

static const CGFloat kMarginMonthAll = 20;
@implementation BCLMonthAllCaloriesCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:0.45f green:0.91f blue:0.71f alpha:1.00f].CGColor,(__bridge id)[UIColor colorWithRed:0.48f green:0.88f blue:0.81f alpha:1.00f].CGColor,(__bridge id)[UIColor colorWithRed:0.51f green:0.85f blue:0.89f alpha:1.00f].CGColor];
        gradientLayer.locations = @[@0.4,@0.5,@1.0];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1.0, 0);
        gradientLayer.frame = self.bounds;
        [self.layer addSublayer:gradientLayer];
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
        
        self.dayTimeLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_dayTimeLabel];
        [_dayTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kMarginMonthAll);
            make.top.equalTo(self).offset(kMarginMonthAll);
            make.width.mas_lessThanOrEqualTo(@86);
            make.height.mas_equalTo(22);
        }];
        _dayTimeLabel.font = [UIFont systemFontOfSize:16];
        _dayTimeLabel.textColor = [UIColor whiteColor];
    }
    return self;
}
@end
