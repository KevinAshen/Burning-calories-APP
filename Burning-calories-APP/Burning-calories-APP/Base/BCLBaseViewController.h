//
//  BCLBaseViewController.h
//  Burning-calories-APP
//
//  Created by mac on 2019/1/22.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BCLBaseViewController : ViewController

//进行tableView的frame设置和注册cell
- (UITableView *)setupBaseTableView;

@end

NS_ASSUME_NONNULL_END
