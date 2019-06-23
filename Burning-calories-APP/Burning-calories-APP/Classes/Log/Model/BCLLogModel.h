//
//  BCLLogModel.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/6/19.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
//@interface BCLUserAvatar : JSONModel
//@property (nonatomic, assign) NSInteger userId;
//@property (nonatomic, copy) NSString *username;
//@property (nonatomic, copy) NSString *avatar;
//@end

@interface BCLFoodDataModel : JSONModel

@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSDictionary *userAvatar;
@property (nonatomic, copy) NSString *foodname;
@property (nonatomic, copy) NSString *updateMethod;
@property (nonatomic, copy) NSString *foodImage;
@property (nonatomic, copy) NSString *calories;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *foodTime;
@property (nonatomic, copy) NSString *createTime;
@end

@interface BCLLogModel : JSONModel

@property (nonatomic, copy) NSString *status;
@property (nonatomic, copy) NSArray<BCLFoodDataModel *> *data;
@end

NS_ASSUME_NONNULL_END
