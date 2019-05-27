//
//  BCLSceneImageAnalyzer.m
//  Burning-calories-APP
//
//  Created by mac on 2019/5/25.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSceneImageAnalyzer.h"
#import "FruitImageClassifier.h"
#import "VegImageClassifier.h"

@interface BCLSceneImageAnalyzer ()

//识别model，具体类型根据传进来的参数强制转换
@property (nonatomic, strong) id model;

@end

@implementation BCLSceneImageAnalyzer

- (BCLSceneImageAnalyzer *)initWithImageType:(ImageType)type {
    NSURL *modelURL = [self getURLWithImageType:type];
    self = [super init];
    if (type == imageFruit) {
        self.model = [(FruitImageClassifier *)[FruitImageClassifier alloc] initWithContentsOfURL:modelURL error:nil];
    }
    if (type == imageVeg) {
        self.model = [(VegImageClassifier *)[VegImageClassifier alloc] initWithContentsOfURL:modelURL error:nil];
    }
    return self;
}

- (NSURL *)getURLWithImageType:(ImageType)type {
    if (type == imageFruit) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FruitImageClassifier" withExtension:@"mlmodelc"];
        return modelURL;
    }
    if (type == imageVeg) {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"VegImageClassifier" withExtension:@"mlmodelc"];
        return modelURL;
    }
//    if (type == imageCook) {
//        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FruitImageClassifier" withExtension:@"mlmodelc"];
//        return modelURL;
//    }
//    if (type == imagestaple) {
//        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FruitImageClassifier" withExtension:@"mlmodelc"];
//        return modelURL;
//    }
    return nil;
}

- (NSString *)analyzeImage:(UIImage *)originImage imageType:(ImageType)type allPossible:(NSMutableDictionary *)all {
    CGSize size = CGSizeMake(224, 224);
    UIImage *img = [self fitImage:originImage toSize:size];
    CVPixelBufferRef imgBuf = NULL;
    CVReturn status = CVPixelBufferCreate(kCFAllocatorDefault,
                                          size.width,
                                          size.height,
                                          kCVPixelFormatType_32ARGB,
                                          (__bridge CFDictionaryRef) @{(__bridge NSString *) kCVPixelBufferIOSurfacePropertiesKey: @{}},
                                          &imgBuf);
    if (status == kCVReturnSuccess) {
        CIImage *ciImg = [CIImage imageWithCGImage:img.CGImage];
        NSError *err;
        CIContext *ciContext = [CIContext contextWithCGContext:UIGraphicsGetCurrentContext() options:nil];
        [ciContext render:ciImg toCVPixelBuffer:imgBuf];
        if (type == imageFruit) {
            FruitImageClassifierOutput *result = [self.model predictionFromImage:imgBuf error:&err];
            if (err) {
                return [err description];
            } else {
                NSLog(@"---QSTSD---%@", result.classLabelProbs);
                [all addEntriesFromDictionary:result.classLabelProbs];
                NSLog(@"---zzSD--%@", result.classLabel);
                return result.classLabel;
            }
        }
        if (type == imageVeg) {
            VegImageClassifierOutput *result = [(VegImageClassifier *)self.model predictionFromImage:imgBuf error:&err];
            if (err) {
                return [err description];
            } else {
                NSLog(@"---QSTSD---%@", result.classLabelProbs);
                [all addEntriesFromDictionary:result.classLabelProbs];
                NSLog(@"---zzSD--%@", result.classLabel);
                return result.classLabel;
            }
        }
    
        //    if (type == imageCook) {
        //        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FruitImageClassifier" withExtension:@"mlmodelc"];
        //        return modelURL;
        //    }
        //    if (type == imagestaple) {
        //        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"FruitImageClassifier" withExtension:@"mlmodelc"];
        //        return modelURL;
        //    }
    }
    return @"I need more training！";
}

- (UIImage *)fitImage:(UIImage *)image toSize:(CGSize)size {
    CGFloat wfactor = size.width / image.size.width;
    CGFloat hfactor = size.height / image.size.height;
    CGFloat scaleFactor = wfactor>hfactor ? wfactor : hfactor;
    
    UIGraphicsBeginImageContext(size);
    CGRect rect = CGRectMake((size.width - image.size.width * scaleFactor) / 2,
                             (size.height -  image.size.height * scaleFactor) / 2,
                             image.size.width * scaleFactor, image.size.height * scaleFactor);
    
    [image drawInRect:rect];
    
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaledImage;
}

@end
