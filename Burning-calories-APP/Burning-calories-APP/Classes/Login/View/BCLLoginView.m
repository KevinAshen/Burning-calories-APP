//
//  BCLLoginView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/15.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLoginView.h"

static const CGFloat kLoginLeft = 60;

@interface BCLLoginView()<UITextFieldDelegate>

@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIImageView *logoImageView;

@end
@implementation BCLLoginView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.usersTextField = [[UITextField alloc] init];
        [self addSubview:_usersTextField];
        
        self.passwordTextField = [[UITextField alloc] init];
        [self addSubview:_passwordTextField];
        
        self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_loginButton];
        
        self.registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_registerButton];
        
        self.logoImageView = [[UIImageView alloc] init];
        [self addSubview:_logoImageView];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [_usersTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset((k_screen_width - 300) / 2);
        make.top.equalTo(self).offset(300);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(50);
    }];
    _usersTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_login_user"]];
    _usersTextField.leftViewMode = UITextFieldViewModeAlways;
    _usersTextField.layer.cornerRadius = 3;
    _usersTextField.backgroundColor = [UIColor whiteColor];
    _usersTextField.delegate = self;
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_icon_login_shortline"]];
    lineImageView.frame = CGRectMake(32, 8, 2, 38);
    [_usersTextField addSubview:lineImageView];
    _usersTextField.delegate = self;
    
    [_passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.usersTextField.mas_left);
        make.top.equalTo(self.usersTextField.mas_bottom).offset(10);
        make.width.equalTo(self.usersTextField.mas_width);
        make.height.equalTo(self.usersTextField.mas_height);
    }];
    _passwordTextField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_ic_login_password"]];
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    _passwordTextField.backgroundColor = [UIColor whiteColor];
    _passwordTextField.layer.cornerRadius = 3;
    UIImageView *lineImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_icon_login_shortline"]];
    lineImageView2.frame = CGRectMake(32, 8, 2, 38);
    [_passwordTextField addSubview:lineImageView2];
    _passwordTextField.delegate = self;
    
    _logoImageView.frame = CGRectMake(k_screen_width/4, k_screen_width/4, k_screen_width/4, k_screen_width/4);
    _logoImageView.center = CGPointMake(k_screen_width/2, k_screen_width/2);
    _logoImageView.image = [UIImage imageNamed:@"bcl_ic_logo"];
    
    [_loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(k_screen_width/ 2 - 35);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(kLoginLeft / 2);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(70);
    }];
    [_loginButton setImage:[UIImage imageNamed:@"bcl_bt_login"] forState:UIControlStateNormal];
    _loginButton.layer.cornerRadius = 35;
    _loginButton.layer.masksToBounds = YES;
    _loginButton.layer.backgroundColor = [UIColor whiteColor].CGColor;
    [_loginButton addTarget:self action:@selector(clickLoginButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [_registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.usersTextField.mas_right);
        make.top.equalTo(self.passwordTextField.mas_bottom).offset(5);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(20);
    }];
    [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(clickRegisterButton:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)clickLoginButton:(UIButton *)button {
    if(_loginCallBackBlock) {
        self.loginCallBackBlock(button, @"dfc");
    }
}
- (void)clickRegisterButton:(UIButton *)button {
    if(_registerCallBackBlock) {
        self.registerCallBackBlock(button);
    }
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(![self.usersTextField isExclusiveTouch] || ![self.passwordTextField isExclusiveTouch]) {
        [self.usersTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
    }
    return YES;
}
//点击空白收起键盘
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.usersTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
