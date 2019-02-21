//
//  BCLCommunitySegmentView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/21.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义block，用来传递点击的第几个按钮
typedef void (^PassValueBlock)(NSInteger index);

@interface BCLCommunitySegmentView : UIView

//定义一下block
@property (nonatomic, strong) PassValueBlock returnBlock;
@property (nonatomic, strong) UIImageView *selectImage;

//初始化数组，传入frame和名称
- (id) initWithFrame:(CGRect)frame withTitleArray:(NSArray *)array;

//block传递值方法
- (void)setReturnBlock:(PassValueBlock)returnBlock;
@end
