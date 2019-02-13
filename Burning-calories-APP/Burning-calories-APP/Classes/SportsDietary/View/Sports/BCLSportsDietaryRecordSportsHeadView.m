//
//  BCLSportsDietaryRecordSportsHeadView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsHeadView.h"
#import <Masonry.h>

static const NSInteger kTitleHeight = 30;
static const NSInteger kSportsTotalCalorieHeight = 20;

static const NSInteger kViewLeftOrRightInterval = 36;

@interface BCLSportsDietaryRecordSportsHeadView ()

//运动大标题
@property (nonatomic, strong) UILabel *sportsTitleLabel;
//运动消耗的总卡路里标签
@property (nonatomic, strong) UILabel *sportsTotalCalorieLabel;

//运动消耗的总卡路里数目
@property (nonatomic, assign) NSInteger sportsTotalCalorieNumber;

@end

@implementation BCLSportsDietaryRecordSportsHeadView

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
    
    [self setupSportsTitleLabel];
    [self setupSportsTotalCalorieLabel];
}

#pragma mark - 运动标题Label设置
- (void)setupSportsTitleLabel {
    self.sportsTitleLabel = [[UILabel alloc] init];
    [self addSubview:_sportsTitleLabel];
    
    [_sportsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.height.mas_equalTo(kTitleHeight);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    [_sportsTitleLabel setText:@"运动"];
    [_sportsTitleLabel setTextColor:[UIColor whiteColor]];
    [_sportsTitleLabel setFont:[UIFont systemFontOfSize:24]];
}

#pragma mark - 总卡路里Label设置
- (void)setupSportsTotalCalorieLabel {
    self.sportsTotalCalorieLabel = [[UILabel alloc] init];
    [self addSubview:_sportsTotalCalorieLabel];
    
    [_sportsTotalCalorieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-kViewLeftOrRightInterval);
        make.bottom.equalTo(self.mas_bottom).offset(0);
        make.height.mas_equalTo(kSportsTotalCalorieHeight);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    NSString *totalCalorieStr = [NSString stringWithFormat:@"%ld千卡", _sportsTotalCalorieNumber];
    _sportsTotalCalorieLabel.text = totalCalorieStr;
    [_sportsTotalCalorieLabel setTextColor:[UIColor whiteColor]];
}

#pragma mark - 更新运动消耗的总卡路里数目
- (void)reloadSportsTotalCalorieNumber:(NSInteger)totalCalorieNumber {
    _sportsTotalCalorieNumber = totalCalorieNumber;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
