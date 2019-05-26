//
//  BCLRegisterViewController.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/16.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseViewController.h"

typedef void(^ReturnValueBlock)(NSString *passedUserName, NSString *passedPassword);

@interface BCLRegisterViewController : BCLBaseViewController

@property (nonatomic, copy) ReturnValueBlock returnValueBlock;

@end
