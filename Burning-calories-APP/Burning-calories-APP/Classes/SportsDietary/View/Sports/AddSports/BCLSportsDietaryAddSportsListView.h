//
//  BCLSportsDietaryAddSportsListView.h
//  Burning-calories-APP
//
//  Created by mac on 2019/2/26.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BCLSportsDietaryAddSportsListView : UIView

//增加运动tableView
@property (nonatomic, strong) UITableView *addSportsTableView;

- (UITableView *)getAddSportsTableView;

@end

NS_ASSUME_NONNULL_END
