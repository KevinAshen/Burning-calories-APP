//
//  BCLOtherWeekDayRecordCollectionViewCell.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/1.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^loveButtonClick) (UIButton *sender);

@interface BCLOtherWeekDayRecordCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImageView *weekFoodImageView;
@property (nonatomic, strong) UILabel *weekOfTimeLabel;
@property (nonatomic, strong) UILabel *everydayCaloriesLabel;
@property (nonatomic, strong) UIButton *loveButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, copy)loveButtonClick loveButtonAction;

@end
