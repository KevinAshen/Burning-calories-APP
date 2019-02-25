//
//  BCLImageListView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/24.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLImageListView.h"

@interface BCLImageListView ()
//图片数组
@property (nonatomic, strong) NSArray *imageArray;
//图片视图数组
@property (nonatomic, strong) NSMutableArray *imageViewsArray;
//预览视图

@end
@implementation BCLImageListView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        //小图（九宫格)
        _imageViewsArray = [[NSMutableArray alloc] init];
        for (int i = 0;i < 9; i++) {
            BCLOneImageVIew *imageView = [[BCLOneImageVIew alloc] initWithFrame:CGRectZero];
            imageView.tag = 1000 + i;
            [imageView setTapSmallView:^(BCLOneImageVIew *imageView) {
                
            }];
            [_imageViewsArray addObject:imageView];
            [self addSubview:imageView];
        }
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

@implementation BCLOneImageVIew

@end
