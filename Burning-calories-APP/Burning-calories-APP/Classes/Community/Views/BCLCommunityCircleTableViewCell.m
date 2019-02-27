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
static const CGFloat kThreeButtonConstance = 110;

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
        [self.iconImageButton setImage:[UIImage imageNamed:@"bcl_ic_community_circleCell"] forState:UIControlStateNormal];
        
        self.nickNameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_nickNameLabel];
        [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_right).offset(kCommunityMargin);
            make.top.equalTo(self.iconImageButton.mas_top);
            make.width.mas_lessThanOrEqualTo(@50);
            make.height.mas_equalTo(20);
        }];
        self.nickNameLabel.text = @"Amy";
        self.nickNameLabel.font = [UIFont systemFontOfSize:14];
        
        self.elapsedTimeLabel = [[UILabel alloc]init];
        [self.contentView addSubview:_elapsedTimeLabel];
        [_elapsedTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nickNameLabel.mas_left);
            make.top.equalTo(self.nickNameLabel.mas_bottom).offset(1);
            make.width.mas_lessThanOrEqualTo(@80);
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
        
        _transmitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_transmitButton];
        [_transmitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageButton.mas_left);
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-kCommunityMargin / 3);
            make.width.mas_equalTo(30);
            make.height.mas_equalTo(17);
        }];
        [self setThreeButton:_transmitButton andImageString:@"bcl_ic_community_circleCell_share" andTitle:@"3"];
        
        self.commitButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_commitButton];
        [_commitButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.transmitButton.mas_right).offset(kThreeButtonConstance);
            make.top.equalTo(self.transmitButton.mas_top);
            make.width.equalTo(self.transmitButton.mas_width);
            make.height.equalTo(self.transmitButton.mas_height);;
        }];
        [self setThreeButton:_commitButton andImageString:@"bcl_ic_community_circleCell_commit" andTitle:@"3"];
        
        self.likesButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.contentView addSubview:_likesButton];
        [_likesButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.commitButton.mas_right).offset(kThreeButtonConstance);
            make.top.equalTo(self.transmitButton.mas_top);
            make.width.equalTo(self.transmitButton.mas_width);
            make.height.equalTo(self.transmitButton.mas_height);
        }];
        [self setThreeButton:_likesButton andImageString:@"bcl_ic_community_circleCell_likes" andTitle:@"3"];
    
        if([type isEqualToString:@"imageTableViewCell"]) {
            NSMutableArray *imageArray = [[NSMutableArray alloc]initWithObjects:@"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3110881033,2007189544&fm=26&gp=0.jpg",
            @"https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=2487114660,3715789872&fm=26&gp=0.jpg",
            @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2022825927,4080151337&fm=26&gp=0.jpg",
            @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3409408983,232289470&fm=27&gp=0.jpg",
            @"https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1621006471,2082577216&fm=26&gp=0.jpg",
            @"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3737190694,876071200&fm=26&gp=0.jpg",
            @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=2927189981,1776495486&fm=27&gp=0.jpg",
            @"https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=3530818737,3303073876&fm=26&gp=0.jpg",
            @"https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=4107522323,2122317060&fm=26&gp=0.jpg", nil];
            _listView = [[BCLImageListView alloc]initWithFrame:CGRectZero andImageArray:imageArray];
            [self addSubview:_listView];
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
