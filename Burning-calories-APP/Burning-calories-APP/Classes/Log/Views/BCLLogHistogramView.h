//
//  BCLLogHistogramView.h
//  折线图
//
//  Created by 强淑婷 on 2019/1/27.
//  Copyright © 2019年 强淑婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLLogHistogramView : UIView

@property (nonatomic, assign) CGRect myFrame;

-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues AdddistanceValues:(NSInteger )adddistance  StartingValues:(NSInteger)starting ProportionValuess:(NSInteger)proportion;
-(void)drawBarChartViewWithX_Value_Names:(NSMutableArray *)x_names TargetValues:(NSMutableArray *)targetValues;

@end
