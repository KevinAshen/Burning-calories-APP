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
