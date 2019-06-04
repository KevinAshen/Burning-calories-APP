//
//  BCLImageRecognitionPickerView.m
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/6/3.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLImageRecognitionPickerView.h"

static const NSInteger kBounceViewHight = 400;

@implementation BCLImageRecognitionPickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
//    [self setupPickerView];
    [self setupTextField];
}

- (void)setupPickerView {
    self.pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kBounceViewHight / 3.0 * 2, k_screen_width, kBounceViewHight / 3.0)];
    [self addSubview:_pickerView];
    
    if (self.bounceShow) {
        self.bounceShow();
    } else {
        NSLog(@"dsd");
    }
}



- (void)setupTextField {
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(0, kBounceViewHight / 3.0, k_screen_width, kBounceViewHight / 3.0)];
    [self addSubview:_textField];
    
    _textField.enabled = NO;
    _textField.text = @"FUCK";
}


@end
