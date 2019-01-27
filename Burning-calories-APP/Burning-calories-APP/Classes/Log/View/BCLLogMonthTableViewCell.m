//
//  BCLLogMonthTableViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/25.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogMonthTableViewCell.h"
#import <Masonry.h>
#import "BCLLogHistogramView.h"

static const CGFloat kTopMargin = 22;
static const CGFloat kRightMargin = 9;

@implementation BCLLogMonthTableViewCell

-(NSMutableArray *)x_names{
    if (!_x_names) {
        _x_names = [NSMutableArray arrayWithArray:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12"]];
    }
    return _x_names;
}
/**
 *  Y轴值
 */
-(NSMutableArray *)targets{
    if (!_targets) {
        _targets = [NSMutableArray arrayWithArray:@[@20,@40,@20,@50,@30,@90,@30,@100,@70,@20,@40,@20]];
    }
    return _targets;
}
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
    
    self.smallArrowImageView  = [[UIImageView alloc]init];
    [self addSubview:_smallArrowImageView];
    [_smallArrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-kRightMargin);
        make.top.equalTo(self.timeRecordLabel.mas_top);
        make.width.mas_equalTo(23);
        make.height.mas_equalTo(23);
    }];
    _smallArrowImageView.image = [UIImage imageNamed:@"bcl_log_month_arrow"];
    
    _logHistogramView = [[BCLLogHistogramView alloc] initWithFrame:CGRectMake(141, 50, 270, 100)];
    [self addSubview:_logHistogramView];
//    [_logHistogramView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(141);
//        make.top.equalTo(self.timeRecordLabel.mas_top);
//        make.width.mas_equalTo(270);
//        make.height.mas_equalTo(150);
//    }];
    [self.logHistogramView drawBarChartViewWithX_Value_Names:self.x_names TargetValues:self.targets];
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
