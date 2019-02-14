//
//  BCLWeekTimeRecordCollectionViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/1.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLWeekTimeRecordCollectionViewCell.h"
#import <Masonry.h>
static const CGFloat kMarginWeek = 8;

@implementation BCLWeekTimeRecordCollectionViewCell

- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        self.weekFoodImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_weekFoodImageView];
        [self.weekFoodImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kMarginWeek);
            make.top.equalTo(self).offset(kMarginWeek);
            make.width.mas_equalTo(285);
            make.height.mas_equalTo(158);
        }];
        
        self.weekOfTimeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_weekOfTimeLabel];
        [_weekOfTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.weekFoodImageView.mas_left);
            make.top.equalTo(self.weekFoodImageView.mas_top).offset(2);
            make.width.mas_lessThanOrEqualTo(@56);
            make.height.mas_equalTo(33);
        }];
        _weekOfTimeLabel.text = @"Day1";
        _weekOfTimeLabel.textColor = [UIColor whiteColor];
        _weekOfTimeLabel.font = [UIFont systemFontOfSize:24];
        
        
        self.everydayCaloriesLabel = [[UILabel alloc] init];
        [self.contentView addSubview:_everydayCaloriesLabel];
        [_everydayCaloriesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.weekFoodImageView.mas_left);
            make.top.equalTo(self.weekFoodImageView.mas_bottom).offset(kMarginWeek);
            make.width.mas_lessThanOrEqualTo(@80);
            make.height.mas_equalTo(20);
        }];
        _everydayCaloriesLabel.textColor = [UIColor lightGrayColor];
        _everydayCaloriesLabel.font = [UIFont systemFontOfSize:14];
        
        self.shareButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_shareButton];
        [self.shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-2 * kMarginWeek);
            make.top.equalTo(self.everydayCaloriesLabel.mas_top);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [self.shareButton setImage:[UIImage imageNamed:@"bcl_ic_log_week_share"] forState:UIControlStateNormal];
        [self.shareButton setImage:[UIImage imageNamed:@"bcl_ic_log_week_share_selected"] forState:UIControlStateSelected];
        
        self.loveButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_loveButton];
        [self.loveButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.shareButton.mas_left).offset(-40);
            make.top.equalTo(self.everydayCaloriesLabel.mas_top);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(20);
        }];
        [_loveButton setImage:[UIImage imageNamed:@"bcl_ic_log_week_aixin"] forState:UIControlStateNormal];
        [_loveButton setImage:[UIImage imageNamed:@"bcl_ic_log_week_aixin_selected"] forState:UIControlStateSelected];
        
        
    }
    return self;
}
@end
