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

//取消右侧tagView
- (void)cancelRightTagView;
//返回tagView
- (BCLSportsDietaryAddSportsListTagView *)getTagView;

@end

NS_ASSUME_NONNULL_END
