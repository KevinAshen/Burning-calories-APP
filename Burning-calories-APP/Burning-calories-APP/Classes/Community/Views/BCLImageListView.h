//
//  BCLImageListView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/24.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BCLCommunityMoment.h"

@interface BCLImageListView : UIView

//动态
@property (nonatomic, strong) BCLCommunityMoment *moment;

@end
//单个小图显示视图
@interface BCLOneImageView : UIImageView

//点击小图
@property (nonatomic, copy) void (^tapSmallView)(BCLOneImageView *imageView);

@end
