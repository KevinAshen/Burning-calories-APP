//
//  BCLLogView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@class BCLLogHeaderView;
@class BCLLogMonthTableViewCell;
@class BCLLogDayWeekTableViewCell;

NS_ASSUME_NONNULL_BEGIN
@interface BCLLogView : UIView<UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *foodArray;

@end
NS_ASSUME_NONNULL_END
