//
//  BCLMineTableView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/13.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMineTableView.h"
#import "BCLMineTopTableViewCell.h"


@interface BCLMineTableView()<UITableViewDataSource>

@end
@implementation BCLMineTableView
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if(self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        
        [self registerClass:[BCLMineTopTableViewCell class] forCellReuseIdentifier:@"topCell"];
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 0) {
        return 1;
    } else {
        return 8;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        BCLMineTopTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"topCell" forIndexPath:indexPath];
        if(!cell) {
            cell = [[BCLMineTopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"topCell"];
            
        }
        id data = nil;
        [cell reloadCellWithData:data];
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"mineCell"];
        if(!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mineCell"];
            
        }
        cell.textLabel.text = @"11111";
        cell.imageView.image = [UIImage imageNamed:@"bcl_ic_mine_tabBar"];
        
        return cell;
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
