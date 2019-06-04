//
//  BCLImageRecognitionBounceView.m
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/6/3.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLImageRecognitionBounceView.h"
#import "BCLImageRecognitionPickerView.h"

static const NSInteger kBounceViewHight = 400;

@interface BCLImageRecognitionBounceView ()

@end

@implementation BCLImageRecognitionBounceView

//时间选择View设置
- (void)setupImageRecognitionPickerView {
    self.frame = CGRectMake(0, 0, k_screen_width, kBounceViewHight);
    
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_imageRecognitionPickerView == nil) {
        
        _imageRecognitionPickerView = [[BCLImageRecognitionPickerView alloc]initWithFrame:CGRectMake(0, k_screen_height - kBounceViewHight, k_screen_width, kBounceViewHight)];
        _imageRecognitionPickerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_imageRecognitionPickerView];
    }
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [self setupImageRecognitionPickerView];
    
    [view addSubview:self];
    [view addSubview:_imageRecognitionPickerView];
    
    [_imageRecognitionPickerView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBounceViewHight)];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.alpha = 1.0;
        
        [self.imageRecognitionPickerView setFrame:CGRectMake(0, k_screen_height - kBounceViewHight, k_screen_width, kBounceViewHight)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {
    
    [_imageRecognitionPickerView setFrame:CGRectMake(0, k_screen_height - kBounceViewHight, k_screen_width, kBounceViewHight)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [self.imageRecognitionPickerView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBounceViewHight)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [self.imageRecognitionPickerView removeFromSuperview];
                         
                     }];
    
}


@end
