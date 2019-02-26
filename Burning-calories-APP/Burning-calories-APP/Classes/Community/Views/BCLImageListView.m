//
//  BCLImageListView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/24.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLImageListView.h"
#import "BCLImagePreviewView.h"
//#import "Utility.h"

@interface BCLImageListView ()
//图片数组
@property (nonatomic, strong) NSArray *imageArray;
//图片视图数组
@property (nonatomic, strong) NSMutableArray *imageViewsArray;
//预览视图
@property (nonatomic, strong)BCLImagePreviewView *previewView;
@end

@implementation BCLImageListView
- (instancetype) initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        //小图（九宫格)
        _imageViewsArray = [[NSMutableArray alloc] init];
        for (int i = 0;i < 9; i++) {
            BCLOneImageView *imageView = [[BCLOneImageView alloc] initWithFrame:CGRectZero];
            imageView.tag = 1000 + i;
            [imageView setTapSmallView:^(BCLOneImageView *imageView) {
                
            }];
            [_imageViewsArray addObject:imageView];
            [self addSubview:imageView];
        }
        //预览视图
        _previewView = [[BCLImagePreviewView alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
        //测试网络图片
        _imageArray = [[NSMutableArray alloc] init];
    }
    return self;
}
- (void)setMoment:(BCLCommunityMoment *)moment {
    _moment = moment;
    for (BCLOneImageView *imageView in _imageViewsArray) {
        imageView.hidden = YES;
    }
    //图片区
    NSInteger count = moment.fileCount;
    if (count == 0) {
        self.frame = CGRectMake(0, 0, 0, 0);
        return;
    }
    //更新视图数据
    _previewView.pageNum = count;
    _previewView.scrollView.contentSize = CGSizeMake(_previewView.frame.size.width * count, _previewView.frame.size.height);
    
    //添加图片
    BCLOneImageView *imageView = nil;
    for (NSInteger i = 0; i < count; i++) {
        NSInteger rowNum = i / 3;
        NSInteger colNum = i % 3;
        if(count == 4) {
            rowNum = i / 2;
            colNum = i % 2;
        }
        
        CGFloat imageX = colNum * (kImageWidth + kImagePadding);
        CGFloat imageY = rowNum * (kImageWidth + kImagePadding);
        CGRect frame = CGRectMake(imageX, imageY, kImageWidth, kImageWidth);
        //单张图片需计算实际显示size
        if (count == 1) {
            CGSize singleSize = [Utility getSingleSize:CGSizeMake(moment.singleWidth, moment.singleHeight)];
            frame = CGRectMake(0, 0, singleSize.width, singleSize.height);
        }
        imageView = [self viewWithTag:1000+i];
        imageView.hidden = NO;
        imageView.frame = frame;
        //[imageView sd_setImageWithURL:[NSURL URLWithString:[_imageArray objectAtIndex:i]] placeholderImage:nil];
    }
    self.width = kTextWidth;
    self.height = imageView.bottom;
}
#pragma mark - 小图单击
- (void)singleTapSmallViewCallback:(BCLOneImageView *)imageView
{
    UIWindow *window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    // 解除隐藏
    [window addSubview:_previewView];
    [window bringSubviewToFront:_previewView];
    // 清空
    [_previewView.scrollView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    // 添加子视图
    NSInteger index = imageView.tag-1000;
    NSInteger count = _moment.fileCount;
    CGRect convertRect;
    if (count == 1) {
        [_previewView.pageControl removeFromSuperview];
    }
    for (NSInteger i = 0; i < count; i ++)
    {
        // 转换Frame
        BCLOneImageView *pImageView = (BCLOneImageView *)[self viewWithTag:1000+i];
        convertRect = [[pImageView superview] convertRect:pImageView.frame toView:window];
        // 添加
        BCLPreScrollView *scrollView = [[BCLPreScrollView alloc] initWithFrame:CGRectMake(i*_previewView.width, 0, _previewView.width, _previewView.height)];
        scrollView.tag = 100+i;
        scrollView.maximumZoomScale = 2.0;
        scrollView.image = pImageView.image;
        scrollView.contentRect = convertRect;
        // 单击
        [scrollView setTapBigView:^(BCLPreScrollView *scrollView){
            [self singleTapBigViewCallback:scrollView];
        }];
        // 长按
        [scrollView setLongPressBigView:^(BCLPreScrollView *scrollView){
            [self longPresssBigViewCallback:scrollView];
        }];
        [_previewView.scrollView addSubview:scrollView];
        if (i == index) {
            [UIView animateWithDuration:0.3 animations:^{
                _previewView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
                _previewView.pageControl.hidden = NO;
                [scrollView updateOriginRect];
            }];
        } else {
            [scrollView updateOriginRect];
        }
    }
    // 更新offset
    CGPoint offset = _previewView.scrollView.contentOffset;
    offset.x = index * k_screen_width;
    _previewView.scrollView.contentOffset = offset;
}

#pragma mark - 大图单击||长按
- (void)singleTapBigViewCallback:(BCLPreScrollView *)scrollView
{
    [UIView animateWithDuration:0.3 animations:^{
        _previewView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
        _previewView.pageControl.hidden = YES;
        scrollView.contentRect = scrollView.contentRect;
        scrollView.zoomScale = 1.0;//缩放
    } completion:^(BOOL finished) {
        [_previewView removeFromSuperview];
    }];
}

- (void)longPresssBigViewCallback:(BCLPreScrollView *)scrollView
{
    
}

@end

#pragma mark - ------------------ 单个小图显示视图 ------------------
@implementation BCLOneImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor lightGrayColor];
        self.contentScaleFactor = [[UIScreen mainScreen] scale];
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.clipsToBounds  = YES;
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCallback:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)singleTapGestureCallback:(UIGestureRecognizer *)gesture
{
    if (self.tapSmallView) {
        self.tapSmallView(self);
    }
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end


