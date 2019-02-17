//
//  BCLSportsDietaryRecordDietaryTableViewSectionView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/2/13.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordDietaryTableViewSectionView.h"
#import <Masonry.h>

@interface BCLSportsDietaryRecordDietaryTableViewSectionView ()

@property (nonatomic, strong) UIButton *mealButton;

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
    
}

#pragma mark - mealButton设置
- (void)setupMealButton {
    self.mealButton = [[UIButton alloc] init];
    [self addSubview:_mealButton];
    
    [_mealButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
//        make.bottom.equalTo(self.mas_bottom).offset(0);
//        make.height.mas_equalTo(kTitleHeight);
//        make.width.lessThanOrEqualTo(@(100));
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
