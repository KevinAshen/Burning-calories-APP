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
@property (nonatomic, copy) BounceShow bounceShow;

typedef void(^DismissCancel)(void);
@property (nonatomic, copy) DismissCancel dismissCancel;

@property (nonatomic, strong) UIPickerView *pickerView;

@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, copy) void(^uploadCallBack)(NSString *calories);

- (void)setupSubview;

@end

NS_ASSUME_NONNULL_END
