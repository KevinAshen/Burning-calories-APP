//
//  BCLCommunityCircleTableViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/20.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLCommunityCircleTableViewCell.h"
#import "BCLImageListView.h"
#import <Masonry.h>
static const CGFloat kCommunityMargin = 18;
static const CGFloat kThreeButtonConstance = 118;

@implementation BCLCommunityCircleTableViewCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellType:(NSString *)type {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.iconImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_iconImageButton];
        [self.iconImageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kCommunityMargin);
            make.top.equalTo(self).offset(kCommunityMargin);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(30);
        }];
        self.iconImageButton.layer.cornerRadius = 15;
        [self.iconImageButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        self.nickNameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_nickNameLabel];
        [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton).offset(kCommunityMargin);
            make.top.equalTo(self.iconImageButton.mas_top);
            make.width.mas_equalTo(27);
            make.height.mas_equalTo(20);
        }];
        self.nickNameLabel.text = @"Amy";
        self.nickNameLabel.font = [UIFont systemFontOfSize:14];
        
        self.elapsedTimeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_elapsedTimeLabel];
        [_elapsedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nickNameLabel.mas_left);
            make.top.equalTo(self.nickNameLabel.mas_bottom).offset(1);
            make.width.mas_equalTo(45);
            make.height.mas_equalTo(17);
        }];
        _elapsedTimeLabel.textColor = [UIColor lightGrayColor];
        _elapsedTimeLabel.font = [UIFont systemFontOfSize:12];
        _elapsedTimeLabel.text = @"一分钟前";
        
        _phoneModelsLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_phoneModelsLabel];
        [_phoneModelsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.elapsedTimeLabel.mas_right).offset(kCommunityMargin);
            make.top.equalTo(self.elapsedTimeLabel.mas_top);
            make.width.mas_lessThanOrEqualTo(@80);
            make.height.mas_equalTo(17);
        }];
        _phoneModelsLabel.text = @"来自iphoneX";
        _phoneModelsLabel.textColor = [UIColor lightGrayColor];
        _phoneModelsLabel.font = [UIFont systemFontOfSize:12];
        
        _transmitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_transmitButton];
        [_transmitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_left);
            make.top.equalTo(self.contentView.mas_bottom).offset(kCommunityMargin / 3);
            make.width.mas_equalTo(20);
            make.height.mas_equalTo(17);
        }];
        [self setThreeButton:_transmitButton andImageString:@"" andTitle:@"3"];
        
        self.commitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_commitButton];
        [_commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.transmitButton.mas_right).offset(kThreeButtonConstance);
            make.top.equalTo(self.transmitButton.mas_top);
            make.width.mas_equalTo(17);
            make.height.mas_equalTo(17);
        }];
        [self setThreeButton:_commitButton andImageString:@"" andTitle:@"3"];
        
        self.likesButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_likesButton];
        [_likesButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commitButton.mas_right).offset(kThreeButtonConstance);
            make.top.equalTo(self.transmitButton.mas_top);
            make.width.mas_equalTo(17);
            make.height.mas_equalTo(17);
        }];
        [self setThreeButton:_likesButton andImageString:@"" andTitle:@"3"];
    
        if([type isEqualToString:@"imageTableViewCell"]) {
            BCLImageListView *listView = [[BCLImageListView alloc]initWithFrame:CGRectZero];
            [self addSubview:listView];
        } else if([type isEqualToString:@"NoneTableViewCell"]) {
            
        } else if([type isEqualToString:@""]) {
            
        }
    }
    return self;
}
- (void)setThreeButton:(UIButton *)button andImageString:(NSString *)imageString andTitle:(NSString *)title{
    [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
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
