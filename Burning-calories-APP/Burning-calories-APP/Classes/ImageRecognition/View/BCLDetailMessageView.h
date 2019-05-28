//
//  BCLDetailMessageView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, DetailType) {
    detailFoodName, //名称
    detailCalories, //卡路里
    detailIngredient    //配料
};

@interface BCLDetailMessageView : UIView

- (instancetype)initWithDetailType:(DetailType)type detailLabel:(NSString *)detailStr;

@end

NS_ASSUME_NONNULL_END
