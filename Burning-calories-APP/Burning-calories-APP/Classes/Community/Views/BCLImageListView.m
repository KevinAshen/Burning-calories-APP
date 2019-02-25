//
//  BCLImageListView.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/24.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLImageListView.h"
#import "BCLImagePreviewView.h"
//#import ""

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
        
        //CGFloat imageX = colNum * (kImageWidth + )
        CGRect frame;
        //单张图片需计算实际显示size
        if (count == 1) {
            //CGSize singleSize = [Utility getSingleSize:CGSizeMake(moment.singleWidth, moment.singleHeight)];
            //frame = CGRectMake(0, 0, singleSize.width, singleSize.height);
        }
        imageView = [self viewWithTag:1000+i];
        imageView.hidden = NO;
        imageView.frame = frame;
        //[imageView sd_setImageWithURL:[NSURL URLWithString:[_imageArray objectAtIndex:i]] placeholderImage:nil];
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

@implementation BCLOneImageView

@end
