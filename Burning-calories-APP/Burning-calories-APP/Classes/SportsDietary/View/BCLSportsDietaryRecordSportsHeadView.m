//
//  BCLSportsDietaryRecordSportsHeadView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsHeadView.h"
#import <Masonry.h>

static const NSInteger kSegmentedControlHeight = 30;
static const NSInteger kTitleHeight = 30;
static const NSInteger kCellHeight = 75;
static const NSInteger kAddHeight = 45;

static const NSInteger kTitleInterval = 30;
static const NSInteger kCellInterval = 15;
static const NSInteger kAddInterval = 45;
static const NSInteger kBottomInterval = 60;

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

#pragma mark - 更新运动消耗的总卡路里数目


#pragma mark - UI设置
- (void)setupUI {

}

#pragma mark - 运动标题Label设置
- (void)setupSportsTitleLabel {
    self.sportsTitleLabel = [[UILabel alloc] init];
    [self addSubview:_sportsTitleLabel];
    
    [_sportsTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
        make.top.equalTo(self.mas_top).offset(kTitleInterval);
        make.height.mas_equalTo(kTitleHeight);
        make.width.lessThanOrEqualTo(@(100));
    }];
    
    _sportsTotalCalorieLabel.text = @"运动";
}

#pragma mark - 总卡路里Label设置
- (void)setupSportsTotalCalorieLabel {
    self.sportsTotalCalorieLabel = [[UILabel alloc] init];
    [self addSubview:_sportsTotalCalorieLabel];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
