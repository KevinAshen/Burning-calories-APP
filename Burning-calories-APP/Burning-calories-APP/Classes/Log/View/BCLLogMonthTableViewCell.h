//
//  BCLLogMonthTableViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/25.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseTableViewCell.h"

@class BCLLogHistogramView;
@interface BCLLogMonthTableViewCell : BCLBaseTableViewCell

@property (nonatomic, strong) UIButton *circleButton;
@property (nonatomic, strong) UILabel *timeRecordLabel;
@property (nonatomic, strong) UILabel *caloriesRecordLabel;
@property (nonatomic, strong) UIImageView *smallArrowImageView;
@property (nonatomic, strong) BCLLogHistogramView *logHistogramView;
@property (strong,nonatomic)NSMutableArray *x_names;
@property (strong,nonatomic)NSMutableArray *targets;

@end
