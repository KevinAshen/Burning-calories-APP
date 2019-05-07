//
//  BCLSportsDietaryAddSportsBounceView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/18.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsBounceView.h"
#import "BCLSportsDietaryAddSportsListPickerView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

static const NSInteger kBounceViewHight = 400;

@interface BCLSportsDietaryAddSportsBounceView ()

@property (nonatomic, strong) BCLSportsDietaryAddSportsListPickerView *sportsDietaryAddSportsListPickerView;

@end

@implementation BCLSportsDietaryAddSportsBounceView

//时间选择View设置
- (void)setupSportsDietaryAddSportsListPickerView {
    self.frame = CGRectMake(0, 0, kDeviceWidth, kBounceViewHight);
    
    //alpha 0.0  白色   alpha 1 ：黑色   alpha 0～1 ：遮罩颜色，逐渐
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disMissView)]];
    
    if (_sportsDietaryAddSportsListPickerView == nil) {
        
        _sportsDietaryAddSportsListPickerView = [[BCLSportsDietaryAddSportsListPickerView alloc]initWithFrame:CGRectMake(0, kDeviceHeight - kBounceViewHight, kDeviceWidth, kBounceViewHight)];
        _sportsDietaryAddSportsListPickerView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_sportsDietaryAddSportsListPickerView];
    }
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)showInView:(UIView *)view {
    if (!view) {
        return;
    }
    
    [self setupSportsDietaryAddSportsListPickerView];
    
    [view addSubview:self];
    [view addSubview:_sportsDietaryAddSportsListPickerView];
    
    [_sportsDietaryAddSportsListPickerView setFrame:CGRectMake(0, kDeviceHeight, kDeviceWidth, kBounceViewHight)];
    
    [UIView animateWithDuration:0.1 animations:^{
        
        self.alpha = 1.0;
        
        [self.sportsDietaryAddSportsListPickerView setFrame:CGRectMake(0, kDeviceHeight - kBounceViewHight, kDeviceWidth, kBounceViewHight)];
        
    } completion:nil];
}

//移除从上向底部弹下去的UIView（包含遮罩）
- (void)disMissView {
    
    [_sportsDietaryAddSportsListPickerView setFrame:CGRectMake(0, kDeviceHeight - kBounceViewHight, kDeviceWidth, kBounceViewHight)];
    [UIView animateWithDuration:0.3f
                     animations:^{
                         
                         self.alpha = 0.0;
                         
                         [self.sportsDietaryAddSportsListPickerView setFrame:CGRectMake(0, kDeviceHeight, kDeviceWidth, kBounceViewHight)];
                     }
                     completion:^(BOOL finished){
                         
                         [self removeFromSuperview];
                         [self.sportsDietaryAddSportsListPickerView removeFromSuperview];
                         
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
