//
//  BCLCommunityRecipesView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/3/7.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLCommunityRecipesView.h"
#import <Masonry.h>
static const CGFloat kMarigin = 25;

@implementation BCLCommunityRecipesView
- (instancetype)initWithFrame:(CGRect)frame  andRecipesImage:(NSString *)recipesImageString{
    if(self = [super initWithFrame:frame]) {
        self.foodImageView = [[UIImageView alloc]init];
        [self addSubview:_foodImageView];
        [self.foodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kMarigin);
            make.top.equalTo(self).offset(kMarigin);
            make.width.mas_lessThanOrEqualTo(@163);
            make.height.mas_equalTo(103);
        }];
        self.foodImageView.image = [UIImage imageNamed:recipesImageString];
       
        
        self.iconImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:_iconImageButton];
        [self.iconImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.foodImageView.mas_right).offset(2 * kMarigin);
            make.top.equalTo(self).offset(kMarigin/2.0);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        [self.iconImageButton setImage:[UIImage imageNamed:@"bcl_ic_community_circleCell"] forState:UIControlStateNormal];
        
        self.nickNameLabel = [[UILabel alloc]init];
        [self addSubview:_nickNameLabel];
        [self.nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_right).offset(kMarigin / 2.0);
            make.top.equalTo(self.iconImageButton.mas_top);
            make.width.mas_lessThanOrEqualTo(@50);
            make.height.mas_equalTo(20);
        }];
        self.nickNameLabel.text = @"Amy";
        self.nickNameLabel.textColor = [UIColor blackColor];
        self.nickNameLabel.font = [UIFont systemFontOfSize:14];
        
        self.elapsedTimeLabel = [[UILabel alloc]init];
        [self addSubview:_elapsedTimeLabel];
        [self.elapsedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_left);
            make.top.equalTo(self.iconImageButton.mas_bottom).offset(kMarigin/2.0);
            make.width.mas_lessThanOrEqualTo(@40);
            make.height.mas_equalTo(17);
        }];
        self.elapsedTimeLabel.textColor = [UIColor lightGrayColor];
        self.elapsedTimeLabel.text = @"一分钟前";
        self.elapsedTimeLabel.font = [UIFont systemFontOfSize:12];
        
        self.phoneModelsLabel = [[UILabel alloc]init];
        [self addSubview:_phoneModelsLabel];
        [self.phoneModelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.elapsedTimeLabel.mas_right).offset(kMarigin);
            make.top.equalTo(self.elapsedTimeLabel.mas_top);
            make.width.mas_lessThanOrEqualTo(@80);
            make.height.mas_equalTo(self.elapsedTimeLabel.mas_height);
        }];
        self.phoneModelsLabel.textColor = [UIColor lightGrayColor];
        self.phoneModelsLabel.text = @"来自iphoneX";
        self.phoneModelsLabel.font = [UIFont systemFontOfSize:12];
        
        self.foodNameLabel = [[UILabel alloc]init];
        [self addSubview:_foodNameLabel];
        [self.foodNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.elapsedTimeLabel.mas_left);
            make.top.mas_equalTo(self.elapsedTimeLabel.mas_bottom).offset(kMarigin/2.0);
            make.width.mas_equalTo(@56);
            make.height.mas_equalTo(17);
        }];
        self.foodNameLabel.text = @"香菇青菜";
        self.foodNameLabel.font = [UIFont systemFontOfSize:14];
        
        self.caloriesLabel = [[UILabel alloc]init];
        [self addSubview:self.caloriesLabel];
        [self.caloriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_left);
            make.top.equalTo(self.foodNameLabel.mas_bottom).offset(kMarigin / 2.0);
            make.width.mas_lessThanOrEqualTo(@60);
            make.height.mas_equalTo(22);
        }];
        self.caloriesLabel.textColor = [UIColor lightGrayColor];
        self.caloriesLabel.text = @"343千卡";
        self.caloriesLabel.font = [UIFont systemFontOfSize:14];
        
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
