//
//  BCLBounceView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLBounceView.h"
#define kBCLBounceViewHeight k_screen_height / 4.5

@interface BCLBounceView ()

@property (nonatomic, strong) UIView *contentView;

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
        
        [self.contentView setFrame:CGRectMake(0, k_screen_height, k_screen_width, kBCLBounceViewHeight)];
    } completion:nil];
}

- (void)setupContentSubview {
    
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
