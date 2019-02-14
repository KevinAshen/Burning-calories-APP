//
//  BCLSportsDietaryRecordSportsTableViewCellView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/30.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsTableViewCellView.h"
#import <Masonry.h>

static const NSInteger kSportsNameHeight = 20;
static const NSInteger kSportsCalorieHeight = 15;

static const NSInteger kCellLeftAndRightInterval = 36;
static const NSInteger kTopLittleInterval = 10;
static const NSInteger kCalorieToTimeInterval = 10;

static const NSInteger kLeftLittleInterval = 10;
static const NSInteger kLeftNameToTimeInterval = 60;
static const NSInteger kRightLittleInterval = 10;

@interface BCLSportsDietaryRecordSportsTableViewCellView()

//运动项目
@property (nonatomic, strong) UILabel *sportsNameLabel;
//运动时间
@property (nonatomic, strong) UILabel *sportsTimeLabel;
//运动消耗卡路里
@property (nonatomic, strong) UILabel *sportsCalorieLabel;

//删除运动
@property (nonatomic, strong) UIButton *sportsDeleteButton;

@end

@implementation BCLSportsDietaryRecordSportsTableViewCellView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    //self.backgroundColor = [UIColor greenColor];
    UIImage *backgroundImage = [UIImage imageNamed:@"bcl_ic_soprts_tableView_cellBackgroundImage"];
    self.layer.contents = (id)backgroundImage.CGImage;
    [self setupSportsLabel];
    [self setupDeleteButton];
}

#pragma mark - 运动相关Label设置
- (void)setupSportsLabel {
    //运动项目Label
    self.sportsNameLabel = [[UILabel alloc] init];
    [self addSubview:_sportsNameLabel];
    
    [_sportsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kLeftLittleInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(kSportsNameHeight);
        make.width.mas_equalTo(@(100));
    }];
    
    _sportsNameLabel.text = @"快跑";  //!!!TEST!!!
    
    //运动时间Label
    self.sportsTimeLabel = [[UILabel alloc] init];
    [self addSubview:_sportsTimeLabel];
    
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
    [self addSubview:_sportsCalorieLabel];
    
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
    self.sportsDeleteButton = [[UIButton alloc] init];
    [self addSubview:_sportsDeleteButton];
    
    [_sportsDeleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-kRightLittleInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
    }];
    
    [_sportsDeleteButton setImage:[UIImage imageNamed:@"bcl_ic_soprts_tableView_cellDeleteButton"] forState:UIControlStateNormal];
}

#pragma mark - 更新数据
- (void)reloadCellWithData:(id)data {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
