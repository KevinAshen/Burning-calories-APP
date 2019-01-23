//
//  BCLBaseTabBarController.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/22.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface BCLBaseTabBarController : UITabBarController
//传入viewControllers
- (void)setCodeTabbarController:(NSMutableArray *)viewControllerMutableArray andviewControllerTitleMutableArray:(NSArray *)titleMutableArray;

@end
NS_ASSUME_NONNULL_END
