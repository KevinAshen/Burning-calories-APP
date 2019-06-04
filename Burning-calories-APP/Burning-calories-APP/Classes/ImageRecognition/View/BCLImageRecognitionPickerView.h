//
//  BCLImageRecognitionPickerView.h
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/6/3.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>



NS_ASSUME_NONNULL_BEGIN

@interface BCLImageRecognitionPickerView : UIView

typedef void(^BounceShow)(void);
@property (nonatomic,copy) BounceShow bounceShow;

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) UITextField *textField;

- (void)setupPickerView;

@end

NS_ASSUME_NONNULL_END
