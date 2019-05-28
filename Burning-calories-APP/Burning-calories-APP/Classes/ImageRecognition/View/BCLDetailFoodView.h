//
//  BCLDetailFoodView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BCLDetailMessageJSONModel;

NS_ASSUME_NONNULL_BEGIN

@interface BCLDetailFoodView : UIView

- (instancetype)initWithFrame:(CGRect)frame DetailMessageJSONModel:(BCLDetailMessageJSONModel *)model;

- (void)updateWithData:(BCLDetailMessageJSONModel *)data;

@end

NS_ASSUME_NONNULL_END
