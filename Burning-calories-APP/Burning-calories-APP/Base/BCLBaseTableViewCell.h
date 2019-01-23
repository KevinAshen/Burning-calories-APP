//
//  BCLBaseTableViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/22.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface BCLBaseTableViewCell : UITableViewCell
//设置cell控件
- (void)setupUI;
//给cell赋值
- (void)reloadCellWithData:(id)data;

@end
NS_ASSUME_NONNULL_END
