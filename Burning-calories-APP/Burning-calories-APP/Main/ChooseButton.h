//
//  ChooseButton.h
//  Rise-animation-Demo
//
//  Created by mac on 2019/5/16.
//  Copyright © 2019 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, ImageStyle){
    imageTop,    // The picture is under the title.
    imageLeft,   // The picture is in the left title on the right.
    imageBottom, // The title is under the picture.
    imageRight   // The title is in the left picture on the right.
};

@interface ChooseButton : UIButton

@property (nonatomic, assign, readwrite) ImageStyle buttonStyle;
@property (nonatomic, assign) CGFloat    imgScale; ///<- scaling of the picture

@end

NS_ASSUME_NONNULL_END
