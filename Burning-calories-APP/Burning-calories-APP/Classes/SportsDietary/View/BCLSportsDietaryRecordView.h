//
//  BCLSportsDietaryRecordView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/1/24.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BCLSportsDietaryRecordView : UIView

//获取背景scrollView
- (UIScrollView *)getBackgroundScrollView;
//获取运动tableView
- (UITableView *)getSportsTableView;

@end

NS_ASSUME_NONNULL_END
