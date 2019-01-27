//
//  BCLSportsDietaryRecordSportsTableViewCell.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsTableViewCell.h"
#import <Masonry.h>

static const NSInteger kSegmentedControlHeight = 30;
static const NSInteger kTitleHeight = 30;
static const NSInteger kCellHeight = 75;
static const NSInteger kAddHeight = 45;
static const NSInteger kSportsNameHeight = 20;
static const NSInteger kSportsCalorieHeight = 15;

static const NSInteger kTitleInterval = 30;
static const NSInteger kCellInterval = 15;
static const NSInteger kAddInterval = 45;
static const NSInteger kBottomInterval = 60;
static const NSInteger kTopLittleInterval = 10;
static const NSInteger kCalorieToTimeInterval = 10;

static const NSInteger kLeftLittleInterval = 10;
static const NSInteger kLeftNameToTimeInterval = 60;

@interface BCLSportsDietaryRecordSportsTableViewCell ()

//运动项目
@property (nonatomic, strong) UILabel *sportsNameLabel;
//运动时间
@property (nonatomic, strong) UILabel *sportsTimeLabel;
//运动消耗卡路里
@property (nonatomic, strong) UILabel *sportsCalorieLabel;

//删除运动
@property (nonatomic, strong) UIButton *sportsDeleteButton;

@end

@implementation BCLSportsDietaryRecordSportsTableViewCell

#pragma mark - UI设置
- (void)setupUI {
    [self setupSportsLabel];
    [self setupDeleteButton];
}

#pragma mark - 运动相关Label设置
- (void)setupSportsLabel {
    //运动项目Label
    self.sportsNameLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sportsNameLabel];

    [_sportsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kLeftLittleInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(kSportsNameHeight);
        make.width.mas_equalTo(@(100));
    }];
    
    _sportsNameLabel.text = @"快跑";  //!!!TEST!!!
    
    //运动时间Label
    self.sportsTimeLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sportsTimeLabel];
    
    [_sportsTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sportsNameLabel.mas_left).offset(kLeftNameToTimeInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(kSportsNameHeight);
        make.width.mas_equalTo(@(100));
    }];
    
    _sportsTimeLabel.textColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    _sportsTimeLabel.text = @"30分钟"; //!!!TEST!!!
    
    //运动卡路里Label
    self.sportsCalorieLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_sportsCalorieLabel];
    
    [_sportsCalorieLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sportsNameLabel.mas_left).offset(kLeftNameToTimeInterval);
        make.top.equalTo(self.sportsTimeLabel.mas_bottom).offset(kCalorieToTimeInterval);
        make.height.mas_equalTo(kSportsCalorieHeight);
        make.width.mas_equalTo(@(100));
    }];
    
    _sportsCalorieLabel.textColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    _sportsCalorieLabel.text = @"100千卡"; //!!!TEST!!!
    _sportsCalorieLabel.font = [UIFont systemFontOfSize:12];
}

#pragma mark - 删除运动Button设置
- (void)setupDeleteButton {
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
