//
//  BCLRegisterView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/16.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLRegisterView.h"
static const CGFloat kLoginLeft = 60;

@interface BCLRegisterView()<UITextFieldDelegate>

@property (nonatomic, strong)UITextField *userRgTextField;
@property (nonatomic, strong) UITextField *pwdRgTextField;
@property (nonatomic, strong) UITextField *surePwdTextField;
@property (nonatomic, strong) UIButton *sureRgButton;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIButton *cancelButton;
@end

@implementation BCLRegisterView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.userRgTextField = [[UITextField alloc] init];
        [self addSubview:_userRgTextField];
        
        self.pwdRgTextField = [[UITextField alloc] init];
        [self addSubview:_pwdRgTextField];
        
        self.surePwdTextField = [[UITextField alloc] init];
        [self addSubview:_surePwdTextField];
        
        self.sureRgButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_sureRgButton];
        
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_cancelButton];
        
        self.logoImageView = [[UIImageView alloc] init];
        [self addSubview:_logoImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_userRgTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset((k_screen_width - 300) / 2);
        make.top.equalTo(self).offset(260);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
    }];
    _userRgTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_login_user"]];
    _userRgTextField.leftViewMode = UITextFieldViewModeAlways;
    _userRgTextField.layer.cornerRadius = 3;
    _userRgTextField.backgroundColor = [UIColor whiteColor];
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_icon_login_shortline"]];
    lineImageView.frame = CGRectMake(32, 8, 2, 38);
    [_userRgTextField addSubview:lineImageView];
    _userRgTextField.delegate = self;
    
    [_pwdRgTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userRgTextField.mas_left);
        make.top.equalTo(self.userRgTextField.mas_bottom).offset(10);
        make.width.equalTo(self.userRgTextField.mas_width);
        make.height.equalTo(self.userRgTextField.mas_height);
    }];
    _pwdRgTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_login_password"]];
    _pwdRgTextField.leftViewMode = UITextFieldViewModeAlways;
    _pwdRgTextField.backgroundColor = [UIColor whiteColor];
    _pwdRgTextField.layer.cornerRadius = 3;
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_icon_login_shortline"]];
    lineImageView2.frame = CGRectMake(32, 8, 2, 38);
    [_pwdRgTextField addSubview:lineImageView2];
    _pwdRgTextField.delegate = self;
    
    [_surePwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userRgTextField.mas_left);
        make.top.equalTo(self.pwdRgTextField.mas_bottom).offset(10);
        make.width.equalTo(self.userRgTextField.mas_width);
        make.height.equalTo(self.userRgTextField.mas_height);
    }];
    _surePwdTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_login_password"]];
    _surePwdTextField.leftViewMode = UITextFieldViewModeAlways;
    _surePwdTextField.backgroundColor = [UIColor whiteColor];
    _surePwdTextField.layer.cornerRadius = 3;
    UIImageView *lineImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_icon_login_shortline"]];
    lineImageView3.frame = CGRectMake(32, 8, 2, 38);
    [_surePwdTextField addSubview:lineImageView3];
    _surePwdTextField.delegate = self;
    
    _logoImageView.frame = CGRectMake(k_screen_width/4, k_screen_width/4, k_screen_width/4, k_screen_width/4);
    _logoImageView.center = CGPointMake(k_screen_width/2, k_screen_width/2);
    _logoImageView.image = [UIImage imageNamed:@"bcl_ic_logo"];
    
    [_sureRgButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.userRgTextField.mas_left).offset(kLoginLeft / 1.5);
        make.top.equalTo(self.surePwdTextField.mas_bottom).offset(kLoginLeft / 5);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [_sureRgButton setTitle:@"确认注册" forState:UIControlStateNormal];
    [self setButton:_sureRgButton];
    [_sureRgButton addTarget:self action:@selector(sureRgButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sureRgButton.mas_right).offset(kLoginLeft / 7);
        make.top.equalTo(self.sureRgButton.mas_top);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(40);
    }];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [self setButton:_cancelButton];
    [_cancelButton addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setButton:(UIButton *)btn {
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    btn.layer.borderWidth = 0.5;
    btn.layer.cornerRadius = 5;
    btn.titleLabel.font = [UIFont systemFontOfSize:24];
}
- (void)sureRgButtonClick:(UIButton *)button {
    if (self.sureRgCallBackBlock) {
        self.sureRgCallBackBlock(button,self.userRgTextField.text, self.pwdRgTextField.text, self.surePwdTextField.text);
    }
}
- (void)cancelClick:(UIButton *)button {
    if(self.cancelRgCallBackBlock) {
        self.cancelRgCallBackBlock(button);
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
