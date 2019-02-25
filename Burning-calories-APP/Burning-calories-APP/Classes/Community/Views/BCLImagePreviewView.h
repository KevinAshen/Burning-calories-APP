//
//  BCLImagePreviewView.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/25.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BCLImagePreviewView : UIView

// 横向滚动视图
@property (nonatomic,strong) UIScrollView *scrollView;
// 页码指示
@property (nonatomic,strong) UIPageControl *pageControl;
// 页码数目
@property (nonatomic,assign) NSInteger pageNum;
// 页码索引
@property (nonatomic,assign) NSInteger pageIndex;

@end


//单个大图显示视图
@interface BCLPreScrollView : UIScrollView <UIScrollViewDelegate>

//显示的大图
@property (nonatomic, strong) UIImageView *imageView;
//原始frame
@property (nonatomic, assign) CGRect originRect;
//过程frame
@property (nonatomic, assign) CGRect contentRect;
//图片
@property (nonatomic, strong) UIImage *image;
//点击大图（关闭预览）
@property (nonatomic, copy) void (^tapBigView) (BCLPreScrollView *scrollView);
//长按大图
@property (nonatomic, copy) void (^longPressBigView)(BCLPreScrollView *scrollView);

//更新frame
- (void)updateOriginRect;


@end
