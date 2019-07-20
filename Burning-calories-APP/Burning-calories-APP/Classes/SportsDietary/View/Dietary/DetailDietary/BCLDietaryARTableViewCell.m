//
//  BCLDietaryARTableViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/7/18.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLDietaryARTableViewCell.h"
static const NSInteger kSportsNameHeight = 20;

static const NSInteger kTopLittleInterval = 10;

static const NSInteger kLeftLittleInterval = 10;

@interface BCLDietaryARTableViewCell()

//运动项目
@property (nonatomic, strong) UIImageView *bgImageView;
//运动时间
@property (nonatomic, strong) UILabel *dietaryCommitLabel;


@end

@implementation BCLDietaryARTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bgImageView = [[UIImageView alloc] init];
        [self addSubview:_bgImageView];
        
        self.dietaryCommitLabel = [[UILabel alloc] init];
        [self addSubview:_dietaryCommitLabel];
    }
    return self;
}


#pragma mark - 运动相关Label设置
- (void)layoutSubviews{
    [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kLeftLittleInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(k_screen_width - 100);
    }];
    _bgImageView.image = [UIImage imageNamed:@""];
    
    [_dietaryCommitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(kLeftLittleInterval);
        make.top.equalTo(self.mas_top).offset(kTopLittleInterval);
        make.height.mas_equalTo(kSportsNameHeight);
        make.width.mas_equalTo(@(100));
    }];
    _dietaryCommitLabel.textColor = [UIColor blueColor];
    
    
}


#pragma mark - 更新数据
- (void)reloadCellWithData:(id)data {
    _dietaryCommitLabel.text = @"您的早饭已经好了哦～～～";
}


@end
