//
//  BCLBounceView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/5/13.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChooseButton;

NS_ASSUME_NONNULL_BEGIN

@interface BCLBounceView : UIView

//定义block传入button的tag值，确定打开的mlmodel类型
typedef void(^ButtonClickF)(NSInteger tag);
@property (nonatomic, copy) ButtonClickF buttonAction;

///出现弹出框
- (void)showInView:(UIView *)view;


@end

NS_ASSUME_NONNULL_END
