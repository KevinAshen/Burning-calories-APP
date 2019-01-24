//
//  BCLLogView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogView.h"
#import "BCLLogDayWeekTableViewCell.h"
#import "BCLLogHeaderView.h"

@interface BCLLogView ()

@end

@implementation BCLLogView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
       
        [self setTableView:_tableView];
        
    }
    return self;
}
- (void)setTableView:(UITableView *)tableView {
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kDeviceWidth, kDeviceHeight) style:UITableViewStylePlain];
    tableView.dataSource = self;
    [tableView registerClass:[BCLLogDayWeekTableViewCell class] forCellReuseIdentifier:@"dayWeekCell"];
    
    BCLLogHeaderView *logHeaderView = [[BCLLogHeaderView alloc]initWithFrame:CGRectMake(0, 0, kDeviceWidth, 200.0/667 * kDeviceHeight)];
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
    BCLLogDayWeekTableViewCell *dayWeekCell = [_tableView dequeueReusableCellWithIdentifier:@"dayWeekCell" forIndexPath:indexPath];
    if(!dayWeekCell){
        dayWeekCell = [[BCLLogDayWeekTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"dayWeekCell"];
        
        NSArray *timeRecordArray = [NSArray arrayWithObjects:@"日记录",@"周记录",@"月记录", nil];
        NSArray *caloriesRecordArray = [NSArray arrayWithObjects:@"1777千卡",@"1777千卡",@"1777千卡",nil];
        NSArray *circleBackgroudColorArray = [NSArray arrayWithObjects:[UIColor colorWithRed:0.31f green:0.91f blue:0.00f alpha:1.00f],[UIColor colorWithRed:0.34f green:0.49f blue:0.90f alpha:1.00f],[UIColor colorWithRed:1.00f green:0.26f blue:0.00f alpha:1.00f], nil];
        dayWeekCell.timeRecordLabel.text = timeRecordArray[indexPath.row];
        dayWeekCell.caloriesRecordLabel.text = caloriesRecordArray[indexPath.row];
        dayWeekCell.circleButton.backgroundColor = circleBackgroudColorArray[indexPath.row];
        dayWeekCell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
        
    }
    return  dayWeekCell;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



@end
