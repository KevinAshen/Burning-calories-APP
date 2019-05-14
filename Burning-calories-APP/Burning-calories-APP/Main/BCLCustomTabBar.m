//
//  BCLCustomTabBar.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/14.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLCustomTabBar.h"

@interface BCLCustomTabBar()

@property (nonatomic, strong) UIButton *centerButton;
@end

@implementation BCLCustomTabBar
- (UIButton *)centerButton {
    if (_centerButton == nil) {
        _centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _centerButton.frame = CGRectMake(0, 0, 60, 60);
        [_centerButton setImage:[UIImage imageNamed:@"bcl_btn_whole"] forState:UIControlStateNormal];
        [self addSubview:_centerButton];
        [_centerButton addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _centerButton;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    NSMutableArray *tabBarButtonArray = [NSMutableArray array];
    for(UIView *view in self.subviews) {
        if([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButtonArray addObject:view];
        }
    }
    CGFloat barWidth = self.bounds.size.width;
    CGFloat barHeight = self.bounds.size.height;
    CGFloat centerBtnWidth = CGRectGetWidth(self.centerButton.frame);
    CGFloat centerBtnHeight = CGRectGetHeight(self.centerButton.frame);
    self.centerButton.center = CGPointMake(barWidth / 2, barHeight - centerBtnHeight/2 - 5);
    //设置中间按钮的位置，剧中，凸起一丢丢
    //重新布局tabBarItem
    CGFloat barItemWidth = (barWidth - centerBtnWidth) / tabBarButtonArray.count;
    [tabBarButtonArray enumerateObjectsUsingBlock:^(UIView*  _Nonnull view, NSUInteger idx, BOOL * _Nonnull stop) {
        CGRect frame = view.frame;
        if (idx >= tabBarButtonArray.count / 2) {
            //重新设置x坐标，如果排在中间按钮的右边需要加上中间按钮的宽度
            frame.origin.x = idx * barItemWidth + centerBtnWidth;
        } else {
            frame.origin.x = idx * barItemWidth;
        }
        //重新设置宽度
        frame.size.width = barItemWidth;
        view.frame = frame;
    }];
    //把中间按钮带到视图最前面
    [self bringSubviewToFront:self.centerButton];
}
- (void)clickCenterBtn:(UIButton *)button {
    NSLog(@"fdsfs");
}
//让突出的那部分响应事件
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *result = [super hitTest:point withEvent:event];
    //如果事件发生在tabBar里面直接返回
    if(result) {
        return  result;
    }
    //遍历那些超出的部分就可以了，这样写比较通用
    for(UIView *subView in self.subviews) {
        //把这个坐标从tabBar的坐标系转为subView的坐标系
        CGPoint subPoint = [subView convertPoint:point fromView:self];
        result = [subView hitTest:subPoint withEvent:event];
        //如果事件发生在subView里就返回
        if(result) {
            return result;
        }
    }
    return nil;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
