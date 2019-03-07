//
//  BCLCommunityRecipesView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/3/7.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLCommunityRecipesView : UIView

@property (nonatomic, strong) UIImageView *foodImageView;
@property (nonatomic, strong) UIButton *iconImageButton;
@property (nonatomic, strong) UILabel *nickNameLabel;
@property (nonatomic, strong) UILabel *elapsedTimeLabel;
@property (nonatomic, strong) UILabel *phoneModelsLabel;
@property (nonatomic, strong) UILabel *foodNameLabel;
@property (nonatomic, strong) UILabel *caloriesLabel;

- (instancetype)initWithFrame:(CGRect)frame  andRecipesImage:(NSString *)recipesImageString;
@end
