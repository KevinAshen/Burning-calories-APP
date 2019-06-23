//
//  BCLImageRecognitionPickerView.m
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/6/3.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLImageRecognitionPickerView.h"

static const NSInteger kBounceViewHight = 400;
static const NSInteger kMargin = 25;

@interface BCLImageRecognitionPickerView ()

@property (nonatomic, strong) UIButton *affirmButton;
@property (nonatomic, strong) UIButton *cancelButton;

@end

@implementation BCLImageRecognitionPickerView

//- (instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//        [self setupSubview];
//    }
//    return self;
//}

- (void)setupSubview {
    [self setupPickerView];
    [self setupCancelButton];
    [self setupAffirmButton];
    [self setupTextField];
}

- (void)setupPickerView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kBounceViewHight / 2, k_screen_width, kBounceViewHight / 2)];
    [self addSubview:_pickerView];
    
    if (self.bounceShow) {
        self.bounceShow();
    } else {
        NSLog(@"dsd");
    }
}

- (void)setupCancelButton {
    self.cancelButton = [[UIButton alloc] init];
    [self addSubview:_cancelButton];
    
    [_cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-kMargin);
        make.width.mas_equalTo(@(kMargin * 2.5));
        
        make.bottom.equalTo(self.pickerView.mas_top);
        make.height.mas_equalTo(@(kMargin * 2));
    }];
    
    [_cancelButton setBackgroundColor:[UIColor whiteColor]];
    [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [_cancelButton addTarget:self action:@selector(touchCancel) forControlEvents:UIControlEventTouchUpInside];
    [_cancelButton setBackgroundColor:[UIColor colorWithRed:0.28f green:0.29f blue:0.38f alpha:1.00f]];
    _cancelButton.layer.masksToBounds = YES;
    _cancelButton.layer.cornerRadius = 10;
}

- (void)touchCancel {
    if (self.dismissCancel) {
        self.dismissCancel();
    }
}

- (void)setupAffirmButton {
    self.affirmButton = [[UIButton alloc] init];
    [self addSubview:_affirmButton];
    
    [_affirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.cancelButton.mas_left).offset(-kMargin * 0.5);
        make.width.mas_equalTo(@(kMargin * 2.5));
        make.bottom.equalTo(self.pickerView.mas_top);
        make.height.mas_equalTo(@(kMargin * 2));
    }];
    
    [_affirmButton setBackgroundColor:[UIColor whiteColor]];
    [_affirmButton setTitle:@"确认" forState:UIControlStateNormal];
    [_affirmButton setBackgroundColor:[UIColor colorWithRed:0.55f green:0.51f blue:0.81f alpha:1.00f]];
    _affirmButton.layer.masksToBounds = YES;
    _affirmButton.layer.cornerRadius = 10;
    [_affirmButton addTarget:self action:@selector(affirmUpLoadClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)affirmUpLoadClick:(UIButton *)sender {
    if (_uploadCallBack) {
        _uploadCallBack(_textField.text);
    } else {
        NSLog(@"jkwdd");
    }
}
- (void)setupTextField {
    self.textField = [[UITextField alloc] init];
    [self addSubview:_textField];
    
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.affirmButton.mas_left).offset(-kMargin * 0.5);
        make.left.equalTo(self.mas_left).offset(kMargin);
        make.bottom.equalTo(self.pickerView.mas_top);
        make.height.mas_equalTo(@(kMargin * 2));
    }];
    
    _textField.enabled = NO;
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.backgroundColor = [UIColor colorWithRed:0.57f green:0.20f blue:0.48f alpha:1.00f];
    _textField.textAlignment = NSTextAlignmentCenter;
}


@end
