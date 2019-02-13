//
//  BCLSportsDietaryRecordSportsTableViewCell.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryRecordSportsTableViewCell.h"
#import "BCLSportsDietaryRecordSportsTableViewCellView.h"
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

//cell中的齿状View
@property (nonatomic, strong) BCLSportsDietaryRecordSportsTableViewCellView *sportsDietaryRecordSportsTableViewCellView;

@end

@implementation BCLSportsDietaryRecordSportsTableViewCell

#pragma mark - UI设置
- (void)setupUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    [self setupSportsDietaryRecordSportsTableViewCellView];
}

#pragma mark - cell中的齿状View设置
- (void)setupSportsDietaryRecordSportsTableViewCellView {
    _sportsDietaryRecordSportsTableViewCellView = [[BCLSportsDietaryRecordSportsTableViewCellView alloc] initWithFrame:CGRectMake(36, 0, kDeviceWidth - 36 - 36, 75)];
    [self.contentView addSubview:_sportsDietaryRecordSportsTableViewCellView];
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
