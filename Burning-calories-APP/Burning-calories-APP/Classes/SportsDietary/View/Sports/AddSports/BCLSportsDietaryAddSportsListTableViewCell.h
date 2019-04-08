//
//  BCLSportsDietaryAddSportsListTableViewCell.h
//  Burning-calories-APP
//
//  Created by mac on 2019/3/6.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLBaseTableViewCell.h"
@class BCLSportsDietaryAddSportsListTagView;

NS_ASSUME_NONNULL_BEGIN

@interface BCLSportsDietaryAddSportsListTableViewCell : BCLBaseTableViewCell

//运动LeftlistView
@property (nonatomic, strong) BCLSportsDietaryAddSportsListTagView *sportsDietaryAddSportsLeftListTagView;
//运动RightlistView
@property (nonatomic, strong) BCLSportsDietaryAddSportsListTagView *sportsDietaryAddSportsRightListTagView;

//取消右侧tagView
- (void)cancelRightTagView;
//返回tagView
- (BCLSportsDietaryAddSportsListTagView *)getTagView;

@end

NS_ASSUME_NONNULL_END
