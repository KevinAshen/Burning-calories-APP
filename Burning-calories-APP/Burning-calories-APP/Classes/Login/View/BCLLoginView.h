//
//  BCLLoginView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/15.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLLoginView : UIView

@property (nonatomic, copy) void(^loginCallBackBlock)(UIButton *button, NSString *name);
@property (nonatomic, copy)void(^registerCallBackBlock)(UIButton *button);
@property (nonatomic, strong) UITextField *usersTextField;
@property (nonatomic, strong) UITextField *passwordTextField;

@end
