//
//  BCLCommunityCircleTableViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/20.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseTableViewCell.h"
#import "BCLCommunityMoment.h"
@class BCLImageListView;

typedef enum _CommunityTableViewCellStyle {
    NoneTableViewCell,
    imageTableViewCell,
    videoTableViewCell
}CommunityTableViewCellStyle;

@protocol MomentCellDelegate;
@interface BCLCommunityCircleTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *iconImageButton;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) BCLImageListView *listView;
@property (nonatomic, strong) UILabel *elapsedTimeLabel;
@property (nonatomic, strong) UILabel *phoneModelsLabel;
@property (nonatomic, strong) UIButton *transmitButton;
@property (nonatomic, strong) UIButton *commitButton;
@property (nonatomic, strong) UIButton *likesButton;

//动态
@property (nonatomic, strong) BCLCommunityMoment *moment;
//代理
@property (nonatomic, assign) id<MomentCellDelegate> delegate;

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellType:(NSString *)type;
@end

@protocol MomentCellDelegate <NSObject>

@optional

// 点击头像|删除|点赞|评论|全文/收起
- (void)didOperateMoment:(BCLCommunityCircleTableViewCell *)cell operateType:(MMOperateType)operateType;
// 选择评论
//- (void)didSelectComment:(Comment *)comment;
// 点击高亮文字
//- (void)didClickLink:(MLLink *)link linkText:(NSString *)linkText;

@end
