//
//  BCLSportsDietaryAddSportsListTagView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/4.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListTagView.h"
#import <Masonry.h>

static const NSInteger kTitleAddHeightWidth = 25;
static const NSInteger kCellWidth = 90;

static const NSInteger kTittleLeftInterval = 15;
static const NSInteger kTittleAddInterval = 30;

@interface BCLSportsDietaryAddSportsListTagView ()

//运动名字Label
@property (nonatomic, strong) UILabel *sportLabel;
//增加button
@property (nonatomic, strong) UIButton *addButton;

@end

@implementation BCLSportsDietaryAddSportsListTagView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

#pragma mark - sportLabel设置
- (UILabel *)sportLabel {
    if (_sportLabel) {
        _sportLabel = [[UILabel alloc] init];
        [self addSubview:_sportLabel];
        
        [_sportLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).offset(kTittleLeftInterval);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kTitleAddHeightWidth);
            make.width.lessThanOrEqualTo(@(90));
        }];
        
        _sportLabel.textColor = [UIColor blackColor];
        
    }
    return _sportLabel;
}

#pragma mark - 为sportLabel赋值
- (void)setupSportLabelText:(NSString *)sportString {
    self.sportLabel.text = sportString;
}

#pragma mark - addButton设置
- (UIButton *)addButton {
    if (_addButton) {
        _addButton = [[UIButton alloc] init];
        [_addButton addSubview:self];
        
        [_addButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-kTittleAddInterval);
            make.centerY.equalTo(self);
            make.height.mas_equalTo(kTitleAddHeightWidth);
            make.width.mas_equalTo(kTitleAddHeightWidth);
        }];
        
        [_addButton setImage:[UIImage imageNamed:@"bcl_ic_soprts_addSports_addButton"] forState:UIControlStateNormal];
    }
    return _addButton;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
