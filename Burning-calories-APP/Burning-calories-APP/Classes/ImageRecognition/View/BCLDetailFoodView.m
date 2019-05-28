//
//  BCLDetailFoodView.m
//  Burning-calories-APP
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLDetailFoodView.h"
#import "BCLDetailMessageView.h"
#import "BCLDetailMessageJSONModel.h"

@interface BCLDetailFoodView ()

@property (nonatomic, strong) BCLDetailMessageView *foodNameDetailMessageView;
@property (nonatomic, strong) BCLDetailMessageView *caloriesDetailMessageView;
@property (nonatomic, strong) BCLDetailMessageView *ingredientDetailMessageView;

@property (nonatomic, strong) BCLDetailMessageJSONModel *detailMessageJSONModel;

@end

@implementation BCLDetailFoodView

- (instancetype)initWithFrame:(CGRect)frame DetailMessageJSONModel:(BCLDetailMessageJSONModel *)model
{
    self = [super initWithFrame:frame];
    if (self) {
        self.detailMessageJSONModel = model;
        [self setupSubview];
    }
    return self;
}

- (void)setupSubview {
    self.backgroundColor = [UIColor colorWithRed:0.93f green:0.91f blue:0.87f alpha:1.00f];
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 15;
    
    self.foodNameDetailMessageView = [[BCLDetailMessageView alloc] initWithDetailType:detailFoodName detailLabel:_detailMessageJSONModel.dataJSONModel.cnNameStr];
    [self addSubview:_foodNameDetailMessageView];
    
    [_foodNameDetailMessageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kJKWMargin);
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(kJKWInterval);
        make.height.mas_equalTo(@(kJKWMargin + kJKWInterval * 2));
    }];
    
    self.caloriesDetailMessageView = [[BCLDetailMessageView alloc] initWithDetailType:detailCalories detailLabel:_detailMessageJSONModel.dataJSONModel.coloresStr];
    [self addSubview:_caloriesDetailMessageView];

    [_caloriesDetailMessageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kJKWMargin);
        make.centerX.mas_equalTo(self);
        make.top.equalTo(self.foodNameDetailMessageView.mas_bottom).offset(kJKWInterval);
        make.height.mas_equalTo(@(kJKWMargin + kJKWInterval * 2));
    }];

    self.ingredientDetailMessageView = [[BCLDetailMessageView alloc] initWithDetailType:detailIngredient detailLabel:@"配料被qst吃了哦"];
    [self addSubview:_ingredientDetailMessageView];

    [_ingredientDetailMessageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kJKWMargin);
        make.centerX.mas_equalTo(self);
        make.top.equalTo(self.caloriesDetailMessageView.mas_bottom).offset(kJKWInterval);
        make.height.mas_equalTo(@(kJKWMargin + kJKWInterval * 2));
    }];
}

- (void)updateWithData:(BCLDetailMessageJSONModel *)data {
    self.detailMessageJSONModel = [[BCLDetailMessageJSONModel alloc] init];
    _detailMessageJSONModel = data;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
