//
//  BCLLogMonthTableViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/25.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogMonthTableViewCell.h"
#import <Masonry.h>

static const CGFloat kTopMargin = 22;

@implementation BCLLogMonthTableViewCell

- (void)setupUI {
    
    self.timeRecordLabel = [[UILabel alloc]init];
    [self addSubview:_timeRecordLabel];
    [_timeRecordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(54);
        make.top.equalTo(self).offset(kTopMargin);
        make.width.mas_equalTo(kTopMargin * 4);
        make.height.mas_equalTo(kTopMargin);
    }];
    _timeRecordLabel.textColor = [UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:1.00f];
    _timeRecordLabel.font = [UIFont systemFontOfSize:18];
    _timeRecordLabel.text = @"月记录";
    
    
    self.circleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:_circleButton];
    [_circleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self->_timeRecordLabel.mas_left).offset(-kTopMargin);
        make.top.equalTo(self.timeRecordLabel);
        make.width.mas_equalTo(18);
        make.height.mas_equalTo(18);
    }];
    _circleButton.layer.masksToBounds = YES;
    _circleButton.layer.cornerRadius = 9;
    _circleButton.backgroundColor = [UIColor colorWithRed:1.00f green:0.26f blue:0.00f alpha:1.00f];
    
    self.caloriesRecordLabel = [[UILabel alloc]init];
    [self addSubview:_caloriesRecordLabel];
    [_caloriesRecordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeRecordLabel.mas_left);
        make.top.equalTo(self.timeRecordLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(107);
        make.height.mas_equalTo(25);
    }];
    _caloriesRecordLabel.textColor = [UIColor colorWithRed:0.87f green:0.87f blue:0.87f alpha:1.00f];
    _caloriesRecordLabel.font = [UIFont systemFontOfSize:18];
    _caloriesRecordLabel.text = @"577789千卡";
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
