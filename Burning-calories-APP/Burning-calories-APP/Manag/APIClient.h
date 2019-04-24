//
//  APIClient.h
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/4/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Singleton.h"

typedef NS_ENUM(NSInteger, ApiRequestStatusCode) {
    ApiRequestNotReachable = -2, //当前网络已断开
    ApiRequestError = -1,  //请求出错
    ApiRequestOK = 0, //请求成功
};

typedef NS_ENUM(NSInteger, HttpMethod) {
    GET = 0,
    POST = 1,
    DELETE = 2,
    PUT = 3,
    PATH_GET = 4,//GET请求，请求参数到url,处理@"user/account/check/{phone}",{phone}这种情况
    QUERY_GET = 5,// GET请求,填充query参数到url上,处理"?a=1&b=2"这种情况
};
//请求响应Block
typedef void(^APIClientRequestResponse) (ApiRequestStatusCode requestStatusCode, id JSON);

@protocol APIClientDelegate <NSObject>

@required
//拦截成功请求响应数据进行处理
+ (void)handleSuccessRequest:(id)JSON completion:(void(^)(id aJSON))cb;

@end
@interface APIClient : NSObject

//为处理拦截的响应数据而设置的委托
@property (nonatomic, weak) id<APIClientDelegate> delegate;
//声明单例
AS_SINGLETON(APIClient);
//获取当前的网络状态类型（返回：0-No wifi or cellular(无网络), 1-2G, 2-3G, 3-4G, 4-LTE, 5-wifi)
+(int)networkType;

//网络状态监听，应用当前是否有网络：有返回YES， 没有返回NO
+ (void)networkReachableWithBlock:(void(^)(BOOL isReachable))block;
//发送请求，返回JSON格式的响应数据
+ (void)requestURL:(NSString *)urlString httpMethod:(HttpMethod)method contentType:(NSString *)contentType params:(NSDictionary *)params response:(APIClientRequestResponse)response;
//取消所有网络请求
+ (void)cancelAllRequest;


@end
