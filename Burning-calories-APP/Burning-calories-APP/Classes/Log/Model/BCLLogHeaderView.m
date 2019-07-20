//
//  BCLLogHeaderView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogHeaderView.h"
#import <Masonry.h>
static const CGFloat kLeftMargin = 39;
static const CGFloat kTopMargin = 51;

@interface BCLLogHeaderView ()

@property (nonatomic, strong) UIButton *todayCaloriesButton;
@property (nonatomic, strong) UIButton *anticipateCaloriesButton;
@property (nonatomic, strong) UIButton *healthConditionButton;
@property (nonatomic, strong) UILabel *anticipateCaloriesLabel;
@property (nonatomic, strong) UILabel *healthConditionLabel;

@end

@implementation BCLLogHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:1.00f green:0.29f blue:0.16f alpha:1.00f];
        
        self.anticipateCaloriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_anticipateCaloriesButton];
        [_anticipateCaloriesButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kLeftMargin);
            make.top.equalTo(self).offset(kTopMargin);
            make.width.mas_equalTo(63);
            make.height.mas_equalTo(22);
        }];
        [_anticipateCaloriesButton setTitle:@"今日预期" forState:UIControlStateNormal];
        _anticipateCaloriesButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        
        self.todayCaloriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_todayCaloriesButton];
        [_todayCaloriesButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self->_anticipateCaloriesButton.mas_right).offset(55);
            make.top.equalTo(self).offset(30);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        //_todayCaloriesButton.center = self.center;
        _todayCaloriesButton.backgroundColor = [UIColor whiteColor];
        _todayCaloriesButton.layer.masksToBounds = YES;
        _todayCaloriesButton.layer.cornerRadius = 50;
        
        NSMutableAttributedString *titleAttributedString = [[NSMutableAttributedString alloc]initWithString:@"今日卡路里\n1777千夫"];
        _todayCaloriesButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [titleAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:17] range:NSMakeRange(0, 5)];
        [titleAttributedString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(6, 6)];
        [titleAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.00f green:0.00f blue:0.00f alpha:1.00f]  range:NSMakeRange(0, 5)];
        [titleAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f] range:NSMakeRange(6, 6)];
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.alignment = NSTextAlignmentCenter;
        [titleAttributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(6, 6)];
        
        [_todayCaloriesButton setAttributedTitle:titleAttributedString forState:UIControlStateNormal];
        [_todayCaloriesButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        
        self.healthConditionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_healthConditionButton];
        [_healthConditionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-kLeftMargin);
            make.top.equalTo(self.anticipateCaloriesButton);
            make.width.equalTo(self.anticipateCaloriesButton.mas_width);
            make.height.equalTo(self.anticipateCaloriesButton.mas_height);
        }];
        [_healthConditionButton setTitle:@"健康状况" forState:UIControlStateNormal];
        _healthConditionButton.titleLabel.font = [UIFont systemFontOfSize:15];
        
        self.anticipateCaloriesLabel = [[UILabel alloc]init];
        [self addSubview:_anticipateCaloriesLabel];
        [_anticipateCaloriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.anticipateCaloriesButton.mas_left);
            make.top.equalTo(self.anticipateCaloriesButton.mas_bottom).offset(5);
            make.width.mas_equalTo(66);
            make.height.mas_equalTo(16);
        }];
        _anticipateCaloriesLabel.text = @"1777千卡";
        _anticipateCaloriesLabel.textColor = [UIColor colorWithRed:1.00f green:0.67f blue:0.59f alpha:1.00f];
        _anticipateCaloriesLabel.font = [UIFont systemFontOfSize:12];
        
        self.healthConditionLabel = [[UILabel alloc]init];
        [self addSubview:_healthConditionLabel];
        [_healthConditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.healthConditionButton.mas_left);
            make.top.equalTo(self.healthConditionButton.mas_bottom).offset(5);
            make.width.mas_equalTo(46);
            make.height.mas_equalTo(16);
        }];
        _healthConditionLabel.text = @"良好";
        _healthConditionLabel.textColor = [UIColor colorWithRed:1.00f green:0.67f blue:0.59f alpha:1.00f];
        _healthConditionLabel.font = [UIFont systemFontOfSize:12];
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
