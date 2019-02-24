//
//  BCLCommunityMoment.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/2/24.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "JSONModel.h"

@interface BCLCommunityMoment : JSONModel

// 正文
@property (nonatomic, copy) NSString * text;
// 发布位置
@property (nonatomic, copy) NSString * location;
// 发布者名字
@property (nonatomic, copy) NSString * userName;
// 发布者头像路径
@property (nonatomic, copy) NSString * userPortrait;
// 赞的人[逗号隔开的字符串]
@property (nonatomic, copy) NSString * praiseNameList;
// 单张图片的宽度
@property (nonatomic, assign) float singleWidth;
// 单张图片的高度
@property (nonatomic, assign) float singleHeight;
// 图片数量
@property (nonatomic, assign) NSInteger fileCount;
// 发布时间戳
@property (nonatomic, assign) long long time;
// 显示'全文'/'收起'
@property (nonatomic, assign) BOOL isFullText;
// 是否已经点赞
@property (nonatomic, assign) BOOL isPraise;
// 精度
@property (nonatomic, assign) double longitude;
// 维度
@property (nonatomic, assign) double latitude;
// 评论集合

// Moment对应cell高度
@property (nonatomic, assign) float rowHeight;


+ (NSArray *)transients;
@end
