//
//  BCLSportsDietaryAddSportsListPickerView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/11.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListPickerView.h"
#import <Masonry.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kTopViewHeight = 50;
static const NSInteger kButtonWidth = 50;
static const NSInteger kTextFieldHeight = 30;
static const NSInteger kTextFieldWidth = 200;

static const NSInteger kLeftRightInterval = 20;
static const NSInteger kTopBottomInterval = 10;

@interface BCLSportsDietaryAddSportsListPickerView ()

//运动时间选择器
@property (nonatomic, strong) UIDatePicker *sportDatePicker;
//确认ButtonUIResponder
@property (nonatomic, strong) UIButton *confirmButton;
//取消Button
@property (nonatomic, strong) UIButton *cancelButton;
//运动名字TextField
@property (nonatomic, strong) UITextField *sportNameTextField;
//顶部显示View
@property (nonatomic, strong) UIView *topDisplayView;

@end

@implementation BCLSportsDietaryAddSportsListPickerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

#pragma mark - UI设置
- (void)setupUI {
    self.backgroundColor = [UIColor whiteColor];
    [self setupTopDisplayView];
    [self setupSportDatePicker];
}

#pragma mark - 顶部显示View设置
- (void)setupTopDisplayView {
    self.topDisplayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kTopViewHeight)];
    [self addSubview:_topDisplayView];
    
    _topDisplayView.backgroundColor = [UIColor whiteColor];
    
    self.confirmButton = [[UIButton alloc] init];
    [_topDisplayView addSubview:_confirmButton];
    
    [_confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topDisplayView.mas_left).offset(kLeftRightInterval);
        make.top.equalTo(self.topDisplayView.mas_top).offset(kTopBottomInterval);
        make.centerY.equalTo(self.topDisplayView);
        make.width.mas_equalTo(kButtonWidth);
    }];
    
    [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [_confirmButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    self.cancelButton = [[UIButton alloc] init];
    [_topDisplayView addSubview:_cancelButton];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.topDisplayView.mas_right).offset(-kLeftRightInterval);
        make.top.equalTo(self.topDisplayView.mas_top).offset(kTopBottomInterval);
        make.centerY.equalTo(self.topDisplayView);
        make.width.mas_equalTo(kButtonWidth);
    }];
    
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    _sportNameTextField = [[UITextField alloc] init];
    [_topDisplayView addSubview:_sportNameTextField];
    
    [_sportNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topDisplayView);
        make.centerX.equalTo(self.topDisplayView);
        make.width.mas_equalTo(kTextFieldWidth);
        make.height.mas_equalTo(kTextFieldHeight);
    }];
    
    _sportNameTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _sportNameTextField.textAlignment = NSTextAlignmentCenter;
    
}

#pragma mark - 运动时间选择器设置
- (void)setupSportDatePicker {
    self.sportDatePicker = [[UIDatePicker alloc] init];
    [self addSubview:_sportDatePicker];
    
    [_sportDatePicker mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topDisplayView.mas_bottom).offset(0);
        make.left.equalTo(self.mas_left).offset(0);
        make.width.mas_equalTo(kDeviceWidth);
        make.height.mas_equalTo(kDeviceHeight / 2.0);
    }];
    
    //设置地区: zh-中国
    _sportDatePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    //设置日期模式(Displays month, day, and year depending on the locale setting)
    _sportDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    // 设置当前显示时间
    [_sportDatePicker setDate:[NSDate date] animated:YES];
    // 设置显示最大时间（此处为当前时间）
    [_sportDatePicker setMaximumDate:[NSDate date]];
    
    //设置时间格式
    
    //监听DataPicker的滚动
    [_sportDatePicker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    //设置时间输入框的键盘框样式为时间选择器
    self.sportNameTextField.inputView = _sportDatePicker;
}

#pragma mark - 禁止输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return NO;
}

#pragma mark - DatePicker显示设置
- (void)dateChange:(UIDatePicker *)datePicker {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //设置时间格式
    formatter.dateFormat = @"yyyy年 MM月 dd日";
    NSString *dateStr = [formatter  stringFromDate:datePicker.date];
    
    self.sportNameTextField.text = dateStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
