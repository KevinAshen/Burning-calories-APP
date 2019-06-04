//
//  BCLSelectFinishViewController.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/5.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseViewController.h"

@interface BCLSelectFinishViewController : BCLBaseViewController

typedef void(^ButtonClick)(void);
@property (nonatomic, copy) ButtonClick buttonActionPre;

@property (nonatomic, strong) UIImageView *selectImageView;

@property (nonatomic, assign) NSInteger type;

@end
