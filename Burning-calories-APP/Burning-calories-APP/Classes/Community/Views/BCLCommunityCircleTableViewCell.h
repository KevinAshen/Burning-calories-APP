//
//  BCLCommunityCircleTableViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/20.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseTableViewCell.h"

typedef enum _CommunityTableViewCellStyle {
    NoneTableViewCell,
    oneImageTableViewCell,
    videoTableViewCell,
    manyImagesTableViewCell
}CommunityTableViewCellStyle;
@interface BCLCommunityCircleTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *iconImageButton;
@property (nonatomic, strong) UILabel *nickNameLabel;
//@property (nonatomic, strong) UIImageView *shareImageView;
@property (nonatomic, strong) UILabel *elapsedTimeLabel;
@property (nonatomic, strong) UILabel *phoneModelsLabel;
@property (nonatomic, strong) UIButton *transmitButton;
@property (nonatomic, strong) UIButton *commitButton;
@property (nonatomic, strong) UIButton *likesButton;

@end
