//
//  BCLMonthAllCaloriesCollectionViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/3.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FSLineChart.h"
#import "BCLMonthLineChartView.h"
#ifndef OffWidth
#define OffWidth [UIScreen mainScreen].bounds.size.width / 375
#endif
#ifndef OffHeight
#define OffHeight [UIScreen mainScreen].bounds.size.height / 667
#endif
#ifndef ScreenWidth
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#endif
#ifndef ScreenHeight
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#endif
@interface BCLMonthAllCaloriesCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UILabel *dayTimeLabel;
@property (nonatomic, strong) BCLMonthLineChartView *chartView;

@end
