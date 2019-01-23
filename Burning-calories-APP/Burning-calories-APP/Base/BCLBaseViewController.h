//
//  BCLBaseViewController.h
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BCLBaseViewController : UIViewController

//创建tableView
- (UITableView *)refreshBaseTableView;
//进行tableView的frame设置和注册cell
- (UITableView *)setupBaseTableView;

@end

NS_ASSUME_NONNULL_END
