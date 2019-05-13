//
//  BCLMineView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/6.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMineView.h"
#import "BCLMineTableView.h"

@interface BCLMineView()


@end
@implementation BCLMineView
- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.mineTableView = [[BCLMineTableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        [self addSubview:_mineTableView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
