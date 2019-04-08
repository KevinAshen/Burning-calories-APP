//
//  BCLSportsDietaryAddSportsListTagView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/3/4.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BCLSportsDietaryAddSportsListTagView : UIView

typedef void(^ButtonClick)(UIButton *sender);
@property (nonatomic, copy) ButtonClick addButtonAction;

//为sportLabel赋值
- (void)setupSportLabelText:(NSString *)sportString;

@end

NS_ASSUME_NONNULL_END
