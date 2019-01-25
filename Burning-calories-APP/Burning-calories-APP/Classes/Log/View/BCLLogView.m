//
//  BCLLogView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogView.h"
#import "BCLLogDayWeekTableViewCell.h"
#import "BCLLogMonthTableViewCell.h"
#import "BCLLogHeaderView.h"
#import <Masonry.h>

static NSString *const kDayWeekCellIdentifier = @"dayWeekCell";
static NSString *const kMonthCellIdentifier = @"monthCell";
@interface BCLLogView ()

@end

@implementation BCLLogView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setTableView:_tableView];
    }
    return self;
}
- (void)setTableView:(UITableView *)tableView {
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight) style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
    [tableView registerClass:[BCLLogDayWeekTableViewCell class] forCellReuseIdentifier:kDayWeekCellIdentifier];
    [tableView registerClass:[BCLLogMonthTableViewCell class] forCellReuseIdentifier:kMonthCellIdentifier];
    
    BCLLogHeaderView *logHeaderView = [[BCLLogHeaderView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 150.0/667 * kDeviceHeight)];
    tableView.tableHeaderView = logHeaderView;
    
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    tableView.bounces = NO;
    tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    
    [self addSubview:tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if(indexPath.row == 0 || indexPath.row == 1) {
        BCLLogDayWeekTableViewCell *dayWeekCell = [_tableView dequeueReusableCellWithIdentifier:kDayWeekCellIdentifier forIndexPath:indexPath];
        if(!dayWeekCell){
            dayWeekCell = [[BCLLogDayWeekTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kDayWeekCellIdentifier];
            
            NSArray *timeRecordArray = [NSArray arrayWithObjects:@"日记录",@"周记录",nil];
            NSArray *caloriesRecordArray = [NSArray arrayWithObjects:@"1777千卡",@"1777千卡",nil];
            NSArray *circleBackgroudColorArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.31f green:0.91f blue:0.00f alpha:1.00f],[UIColor colorWithRed:0.34f green:0.49f blue:0.90f alpha:1.00f], nil];
            dayWeekCell.timeRecordLabel.text = timeRecordArray[indexPath.row];
            dayWeekCell.caloriesRecordLabel.text = caloriesRecordArray[indexPath.row];
            dayWeekCell.circleButton.backgroundColor = circleBackgroudColorArray[indexPath.row];
            
            dayWeekCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
            
        }
        return  dayWeekCell;
    } else {
        BCLLogMonthTableViewCell *monthCell = [tableView dequeueReusableCellWithIdentifier:kMonthCellIdentifier forIndexPath:indexPath];
        if(!monthCell) {
            BCLLogMonthTableViewCell *monthCell = [[BCLLogMonthTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kMonthCellIdentifier];
            monthCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        }
        return monthCell;
    }
    
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



@end
