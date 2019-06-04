//
//  BCLImageRecognitionBounceView.h
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/6/3.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCLImageRecognitionPickerView;

NS_ASSUME_NONNULL_BEGIN

@interface BCLImageRecognitionBounceView : UIView

@property (nonatomic, strong) BCLImageRecognitionPickerView *imageRecognitionPickerView;

//展示从底部向上弹出的UIView（包含遮罩）
- (void)showInView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
