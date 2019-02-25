//
//  BCLSportsDietaryRecordSportsBottomView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/1/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol BCLSportsDietaryRecordSportsBottomViewDelegate <NSObject>

- (void)addSportsDelegate;

@end

@interface BCLSportsDietaryRecordSportsBottomView : UIView

@property (nonatomic, weak) id<BCLSportsDietaryRecordSportsBottomViewDelegate> sportsDietaryRecordSportsBottomViewDelegate;

@end

NS_ASSUME_NONNULL_END
