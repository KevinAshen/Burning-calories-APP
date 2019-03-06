//
//  BCLSportsDietaryAddSportsListTableViewCell.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/6.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListTableViewCell.h"
#import "BCLSportsDietaryAddSportsListTagView.h"
#import <Masonry.h>

static const NSInteger kCellHeight = 60;
static const NSInteger kCellWidth = 90;

static const NSInteger kViewLeftOrRightInterval = 36;

@interface BCLSportsDietaryAddSportsListTableViewCell ()

//运动listView
@property (nonatomic, strong) BCLSportsDietaryAddSportsListTagView *sportsDietaryAddSportsListTagView;

@end

@implementation BCLSportsDietaryAddSportsListTableViewCell

- (void)setupUI {
    self.contentView.backgroundColor = [UIColor clearColor];
    
}

//运动listView设置
- (BCLSportsDietaryAddSportsListTagView *)sportsDietaryAddSportsListTagView {
    if (_sportsDietaryAddSportsListTagView) {
        _sportsDietaryAddSportsListTagView = [[BCLSportsDietaryAddSportsListTagView alloc] init];
        [self.contentView addSubview:_sportsDietaryAddSportsListTagView];
        
        [_sportsDietaryAddSportsListTagView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(kViewLeftOrRightInterval);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kCellHeight);
            make.width.mas_equalTo(kCellWidth);
        }];
        
    }
    return _sportsDietaryAddSportsListTagView;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
