//
//  BCLBounceView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLBounceView.h"
#define kBCLBounceViewHeight k_screen_height / 3.5

@interface BCLBounceView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *testImageView;

@end

@implementation BCLBounceView

- (void)setupContent {
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_contentView == nil) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, k_screen_height - kBCLBounceViewHeight, k_screen_width, kBCLBounceViewHeight)];
        _contentView.backgroundColor = [UIColor colorWithRed:0.91f green:0.91f blue:0.91f alpha:1.00f];
        [self addSubview:_contentView];
        
        [self setupContentSubview];
    }
}

- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    [self setupContent];
    
    [view addSubview:self];
    [view addSubview:_contentView];
    
    [_contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBCLBounceViewHeight)];
    
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 1.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height - kBCLBounceViewHeight, k_screen_width, kBCLBounceViewHeight)];
    } completion:nil];
}

- (void)setupContentSubview {
    
    _contentView.backgroundColor = [UIColor yellowColor];
    self.testImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bcl_btn_whole.png"]];
    [_contentView addSubview:_testImageView];
    [_testImageView setFrame:CGRectMake(50, 50, 100, 100)];
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    moveAnimation.duration = 0.8; //动画时间
    moveAnimation.fromValue = [NSNumber numberWithFloat:-0.25 * M_PI];
    moveAnimation.toValue = [NSNumber numberWithFloat:0 * M_PI];
    //一个时间函数，代表它是怎么运行的
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    moveAnimation.repeatCount = HUGE_VALF;
    moveAnimation.repeatDuration = 1;
    //moveAnimation.removedOnCompletion = YES;
    //moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面可以拿到中国动画的标志
    [self.testImageView.layer addAnimation:moveAnimation forKey:@"可以拿到中国动画的标志值"];
}

- (void)disMissView {
    [_contentView setFrame:CGRectMake(0, k_screen_height - kBCLBounceViewHeight, k_screen_width, kBCLBounceViewHeight)];
    [UIView animateWithDuration:0.15 animations:^{
        self.alpha = 0.0;
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBCLBounceViewHeight)];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.contentView removeFromSuperview];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
