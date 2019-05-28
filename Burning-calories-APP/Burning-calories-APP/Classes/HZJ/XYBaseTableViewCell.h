//
//  XYBaseTableViewCell.h
//  Burning-calories-APP
//
//  Created by mac on 2019/4/28.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XYBaseTableViewCell : UITableViewCell

+ (CGFloat)getHeight:(id)data;

- (void)updateWithData:(id)data;

@end

NS_ASSUME_NONNULL_END
