//
//  BCLSportsDietaryAddSportsListTableViewCell.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/6.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListTableViewCell.h"
#import "BCLSportsDietaryAddSportsListTagView.h"
#import <Masonry.h>

static const NSInteger kCellHeight = 60;
static const NSInteger kCellWidth = 160;

static const NSInteger kViewLeftOrRightInterval = 36;

@interface BCLSportsDietaryAddSportsListTableViewCell ()

//运动LeftlistView
@property (nonatomic, strong) BCLSportsDietaryAddSportsListTagView *sportsDietaryAddSportsLeftListTagView;
//运动RightlistView
@property (nonatomic, strong) BCLSportsDietaryAddSportsListTagView *sportsDietaryAddSportsRightListTagView;

//标记参数（确定是否有第二个tagView）
@property (nonatomic, assign) BOOL signFlag;


@end

@implementation BCLSportsDietaryAddSportsListTableViewCell

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    self.signFlag = YES;
    [self setupSportsDietaryAddSportsLeftListTagView];
    if (self.signFlag == YES) {
        [self setupSportsDietaryAddSportsRightListTagView];
    }
}

//运动LeftlistView设置
- (void)setupSportsDietaryAddSportsLeftListTagView {
    _sportsDietaryAddSportsLeftListTagView = [[BCLSportsDietaryAddSportsListTagView alloc] init];
    [self.contentView addSubview:_sportsDietaryAddSportsLeftListTagView];
        
    [_sportsDietaryAddSportsLeftListTagView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(kCellHeight);
        make.width.mas_equalTo(kCellWidth);
    }];
        
}

//运动RightlistView设置
- (void)setupSportsDietaryAddSportsRightListTagView {
    _sportsDietaryAddSportsRightListTagView = [[BCLSportsDietaryAddSportsListTagView alloc] init];
    [self.contentView addSubview:_sportsDietaryAddSportsRightListTagView];
    
    [_sportsDietaryAddSportsRightListTagView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sportsDietaryAddSportsLeftListTagView.mas_right).offset(kViewLeftOrRightInterval);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(kCellHeight);
        make.width.mas_equalTo(kCellWidth);
    }];
    
}

//取消右侧tagView
- (void)cancelRightTagView {
    self.signFlag = NO;
}

- (BCLSportsDietaryAddSportsListTagView *)getTagView {
    return self.sportsDietaryAddSportsLeftListTagView;
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
