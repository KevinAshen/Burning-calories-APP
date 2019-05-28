//
//  XYTableView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/4/28.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "XYTableView.h"
#import "ABCTableViewCell.h"

@interface XYTableView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, copy)NSArray * dataArray;

@end
// copy strong weak assign
@implementation XYTableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    [ABCTableViewCell getHeight:self.dataArra[indexPath.row]];
    return 0;
}

@end
