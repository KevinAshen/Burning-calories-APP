//
//  ABCTableViewCell.m
//  Burning-calories-APP
//
//  Created by mac on 2019/4/28.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "ABCTableViewCell.h"

@implementation ABCTableViewCell

+ (CGFloat)getHeight:(id)data{
    if (![data isKindOfClass:NSClassFromString(@"dataclass")]) {
        return 0;
    }
    
    return 0;
}

- (void)updateWithData:(id)data{
    
}

@end
