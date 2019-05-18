//
//  BCLRegisterView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/16.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLRegisterView : UIView

@property (nonatomic, copy) void(^sureRgCallBackBlock)(UIButton *button, NSString *name);
@property (nonatomic, copy)void(^cancelRgCallBackBlock)(UIButton *button);
@end
