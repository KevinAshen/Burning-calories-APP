//
//  BCLSuspensionButton.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/5.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLSuspensionButton.h"

@implementation BCLSuspensionButton
- (instancetype)init {
    if(self = [super init]) {
        self = [BCLSuspensionButton buttonWithType:UIButtonTypeCustom];
        self.frame = CGRectMake(258, 450, 60, 60);//初始在屏幕上的位置
        [self setImage:[UIImage imageNamed:@"bcl_btn_whole"] forState:UIControlStateNormal];
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:
                                       self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [self addGestureRecognizer:pan];
    }
    return self;
}

-(void)locationChange:(UIPanGestureRecognizer*)p{
    CGFloat HEIGHT=self.frame.size.height;
    CGFloat WIDTH = self.frame.size.width;
    BOOL isOver = NO;
    CGPoint panPoint = [p locationInView:[UIApplication sharedApplication].windows[0]];
    CGRect frame = CGRectMake(panPoint.x, panPoint.y, HEIGHT, WIDTH);
    if(p.state == UIGestureRecognizerStateChanged){
        self.center = CGPointMake(panPoint.x, panPoint.y);
    }
    else if(p.state == UIGestureRecognizerStateEnded){
        if (panPoint.x + WIDTH > k_screen_width) {
            frame.origin.x = k_screen_width - WIDTH;
            isOver = YES;
        } else if (panPoint.y + HEIGHT > k_screen_height) {
            frame.origin.y = k_screen_height - HEIGHT;
            isOver = YES;
        } else if(panPoint.x - WIDTH / 2< 0) {
            frame.origin.x = 0;
            isOver = YES;
        } else if(panPoint.y - HEIGHT / 2 < 0) {
            frame.origin.y = 0;
            isOver = YES;
        }
        if (isOver) {
            [UIView animateWithDuration:0.3 animations:^{
                self.frame = frame;
            }];
        }
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
