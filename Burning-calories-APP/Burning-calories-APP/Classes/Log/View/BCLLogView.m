//
//  BCLLogView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLogView.h"

@interface BCLLogView ()

@end

@implementation BCLLogView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorWithRed:0.99f green:0.28f blue:0.14f alpha:1.00f];
        _tableView.dataSource = self;
        BCLLogHeaderView *logHeaderView = [[BCLLogHeaderView alloc]initWithFrame:CGRectMake(0, 0,kDeviceWidth, 250)];
        _tableView.tableHeaderView = logHeaderView;
        [self addSubview:_tableView];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath { 
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"sd" forIndexPath:indexPath];
    if(!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sd"];
    }
    return  cell;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */



@end
