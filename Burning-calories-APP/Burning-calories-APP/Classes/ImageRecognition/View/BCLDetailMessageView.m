//
//  BCLDetailMessageView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLDetailMessageView.h"

@interface BCLDetailMessageView ()

///标志图
@property (nonatomic, strong) UIImageView *iconImageView;
///详细信息
@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, assign) DetailType type;
@property (nonatomic, copy) NSString *detailStr;

@end

@implementation BCLDetailMessageView

- (instancetype)initWithDetailType:(DetailType)type detailLabel:(NSString *)detailStr
{
    self = [super init];
    if (self) {
        self.type = type;
        self.detailStr = detailStr;
        [self setupIconImageView];
        [self setupDetailLabel];
    }
    return self;
}

- (void)setupIconImageView {
    self.iconImageView = [[UIImageView alloc] init];
    [self addSubview:_iconImageView];
    
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kJKWInterval);
        make.top.equalTo(self.mas_top).offset(kJKWInterval);
        
        make.width.mas_equalTo(@(kJKWMargin));
        make.centerY.equalTo(self);
        //make.centerX.equalTo(self).offset(-kJKWMargin);
    }];
    
    [_iconImageView setImage:[self imageWithType:self.type]];
}

- (UIImage *)imageWithType:(DetailType)type {
    UIImage *image = [[UIImage alloc] init];
    switch (type) {
        case detailFoodName:
            image = [UIImage imageNamed:@"五谷浆"];
            break;
        case detailCalories:
            image = [UIImage imageNamed:@"bcl_ic_imageRecognition_calories"];
            break;
        case detailIngredient:
            image = [UIImage imageNamed:@"宝宝粥"];
            break;
        default:
            break;
    }
    return image;
}

- (void)setupDetailLabel {
    self.detailLabel = [[UILabel alloc] init];
    [self addSubview:_detailLabel];
    
    [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImageView.mas_right).offset(kJKWInterval);
        make.top.equalTo(self.mas_top).offset(kJKWInterval);
        make.width.lessThanOrEqualTo(@(kJKWMargin * 5));
        make.centerY.equalTo(self);
    }];
    
    _detailLabel.text = self.detailStr;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
