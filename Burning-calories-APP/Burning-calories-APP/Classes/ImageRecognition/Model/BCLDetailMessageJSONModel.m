//
//  BCLDetailMessageJSONModel.m
//  Burning-calories-APP
//
//  Created by Kevin.J on 2019/5/28.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLDetailMessageJSONModel.h"

@implementation BCLDataJSONModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"idStr":@"id",
                                                                  @"cnNameStr":@"cnName",
                                                                  @"enNameStr":@"enName",
                                                                  @"coloresStr":@"colores",
                                                                  @"typeStr":@"type",
                                                                  @"ingredientStr":@"ingredient",
                                                                  }];
}

@end

@implementation BCLDetailMessageJSONModel

+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
                                                                  @"statusStr":@"status",
                                                                  @"dataJSONModel":@"data",
                                                                  }];
}

@end
