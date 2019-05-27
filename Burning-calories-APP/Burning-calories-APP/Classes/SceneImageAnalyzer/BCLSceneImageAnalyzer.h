//
//  BCLSceneImageAnalyzer.h
//  Burning-calories-APP
//
//  Created by mac on 2019/5/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ImageType) {
    imageFruit, //识别水果
    imageVeg,   //识别蔬菜
    imageCook,  //识别菜肴
    imagestaple //识别主食
};

@interface BCLSceneImageAnalyzer : NSObject

//根据图像类型初始化分析器
- (BCLSceneImageAnalyzer *)initWithImageType:(ImageType)type;
//获取所有可能性预期
- (NSString *)analyzeImage:(UIImage *)originImage imageType:(ImageType)type allPossible:(NSMutableDictionary *)all;

@end

NS_ASSUME_NONNULL_END
