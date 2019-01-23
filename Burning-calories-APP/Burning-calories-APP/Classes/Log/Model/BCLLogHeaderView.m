//
//  BCLLogHeaderView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogHeaderView.h"

@interface BCLLogHeaderView ()
@property (nonatomic, strong) UIButton *todayCaloriesButton;
@property (nonatomic, strong) UILabel *anticipateCaloriesLabel;
@property (nonatomic, strong) UILabel *healthConditionLabel;
@property (nonatomic, strong) UIButton *anticipateCaloriesButton;
@property (nonatomic, strong) UIButton *healthConditionButton;

@end

@implementation BCLLogHeaderView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.todayCaloriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_todayCaloriesButton];
        [_todayCaloriesButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(140);
            make.top.equalTo(self).offset(20);
            make.width.mas_equalTo(100);
            make.height.mas_equalTo(100);
        }];
        _todayCaloriesButton.layer.masksToBounds = YES;
        _todayCaloriesButton.layer.cornerRadius = 50;
        [_todayCaloriesButton setTitle:@"今日卡路里" forState:UIControlStateNormal];
        
        self.anticipateCaloriesLabel = [[UILabel alloc]init];
        [self addSubview:_anticipateCaloriesLabel];
        
        self.healthConditionLabel = [[UILabel alloc]init];
        [self addSubview:_healthConditionLabel];
        
        self.healthConditionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_healthConditionButton];
        
        self.anticipateCaloriesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_anticipateCaloriesButton];
        
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
//    [_todayCaloriesButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(140);
//        make.top.equalTo(self).offset(20);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//    }];
//    _todayCaloriesButton.layer.masksToBounds = YES;
//    _todayCaloriesButton.layer.cornerRadius = 50;
//    [_todayCaloriesButton setTitle:@"今日卡路里" forState:UIControlStateNormal];
    //_todayCaloriesButton
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
