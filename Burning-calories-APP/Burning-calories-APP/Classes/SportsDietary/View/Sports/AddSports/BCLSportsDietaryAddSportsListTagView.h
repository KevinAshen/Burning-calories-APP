//
//  BCLSportsDietaryAddSportsListTagView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/3/4.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BCLSportsDietaryAddSportsListTagViewDelegate <NSObject>

- (void)addDetailSport;

@end

@interface BCLSportsDietaryAddSportsListTagView : UIView

//为sportLabel赋值
- (void)setupSportLabelText:(NSString *)sportString;

@property (nonatomic, weak) id<BCLSportsDietaryAddSportsListTagViewDelegate> sportsDietaryAddSportsListTagViewDelegate;

@end

NS_ASSUME_NONNULL_END
