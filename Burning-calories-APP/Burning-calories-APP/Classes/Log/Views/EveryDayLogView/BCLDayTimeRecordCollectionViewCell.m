//
//  BCLDayTimeRecordCollectionViewCell.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/28.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLDayTimeRecordCollectionViewCell.h"
#import <Masonry.h>
static const CGFloat kLeftMargin = 20;
static const CGFloat kTopMargin = 50;

@implementation BCLDayTimeRecordCollectionViewCell

- (id) initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _backgroundImageView = [[UIImageView alloc]init];
        [self.contentView addSubview:_backgroundImageView];
        [_backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(kLeftMargin);
            make.top.equalTo(self).offset(kTopMargin);
            make.width.mas_equalTo(280);
            make.height.mas_equalTo(200);
            
        }];
        _backgroundImageView.image = [UIImage imageNamed:@"bcl_bg_log_everyday"];
    }
    return self;
}
@end
