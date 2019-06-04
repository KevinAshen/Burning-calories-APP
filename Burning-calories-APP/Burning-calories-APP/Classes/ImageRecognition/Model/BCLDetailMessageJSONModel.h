//
//  BCLDetailMessageJSONModel.h
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/5/28.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BCLDataJSONModel : JSONModel

@property (nonatomic, copy) NSString *idStr;
@property (nonatomic, copy) NSString *enNameStr;
@property (nonatomic, copy) NSString *cnNameStr;
@property (nonatomic, copy) NSString *coloriesStr;
@property (nonatomic, copy) NSString *typeStr;
@property (nonatomic, copy) NSString *ingredientStr;
@property (nonatomic, copy) NSString *qualityStr;
@property (nonatomic, copy) NSString *unitStr;

@end

@interface BCLDetailMessageJSONModel : JSONModel

@property (nonatomic, copy) NSString *statusStr;
@property (nonatomic, strong) BCLDataJSONModel *dataJSONModel;

@end

NS_ASSUME_NONNULL_END
