//
//  APIClient.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/4/23.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "APIClient.h"
#import <AFNetworking.h>

@interface APIClient()

@property (nonatomic, strong) AFHTTPSessionManager *manager;
@end

@implementation APIClient
//定义单例
DEF_SINGLETON(APIClient);
//获取当前的网络状态类型
+ (int)networkType {
    NSArray *subViews = [[[[UIApplication sharedApplication] valueForKey:@"statusBar"] valueForKey:@"foregroundView"] subviews];
    NSNumber *dateNetworkItemView = nil;
    
    for(id subview in subViews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]]) {
            dateNetworkItemView = subview;
            break;
        }
    }
    int ret = 0;
    switch ([[dateNetworkItemView valueForKey:@"dataNetworkType"] integerValue]) {
        case 0:
            ret = 0;
            break;
        case 1:
            ret = 1;
            break;
        case 2:
            ret = 2;
            break;
        case 3:
            ret = 3;
            break;
        case 4:
            ret = 4;
            break;
        case 5:
            ret = 5;
            break;
        default:
            break;
    }
    return ret;
}

//网络状态监听，应用当前是否有网络
+ (void)networkReachableWithBlock:(void (^)(BOOL))block {
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
            case AFNetworkReachabilityStatusReachableViaWiFi:{
                if (block) {
                    block(YES);
                }
                break;
            }
            case AFNetworkReachabilityStatusNotReachable: {
                if(block) {
                    block(NO);
                }
                break;
            }
            default:
                break;
        }
    }];
    //结束监听
    //[AFNetworkReachabilityManager sharedManager] stopMoni
}
//发送请求，返回JSON格式的响应数据
+ (void)requestURL:(NSString *)urlString httpMethod:(HttpMethod)method contentType:(NSString *)contentType params:(NSDictionary *)params response:(APIClientRequestResponse)response{
    if([APIClient networkType] > 0) {
        APIClient *client = [APIClient sharedInstance];
        if(!client.manager) {
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            
            manager.requestSerializer.timeoutInterval = 30;
            manager.requestSerializer = [AFHTTPRequestSerializer serializer];
            [manager.requestSerializer setValue:contentType forHTTPHeaderField:@"Content-Type"];
            manager.responseSerializer = [AFJSONResponseSerializer serializer];
            AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
            manager.responseSerializer = responseSerializer;
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain",@"application/x-www-form-urlencodem", nil];
            client.manager = manager;
        }
        
        __weak typeof(self) weakSelf = self;
        switch (method) {
            case PATH_GET:
                //urlString = APIClient pathGet
                break;
            case GET: {
                [client.manager GET:urlString parameters:nil progress:nil success:^(NSURLSessionDataTask * __unused task, id  JSON) {
                    __strong typeof(weakSelf)strongSelf = weakSelf;
                    if(strongSelf) {
                        [strongSelf handleSuccessRequest:JSON cb:response];
                    }
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if(response) {
                        response(ApiRequestError, nil);
                    }
                }];
                break;
            }case POST:{
                [client.manager POST:urlString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id JSON) {
                    __strong typeof(weakSelf)strongSelf = weakSelf;
                    if(strongSelf) {
                        [strongSelf handleSuccessRequest:JSON cb:response];
                    }
                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                    if(response) {
                        response(ApiRequestError, nil);
                    }
                }];
                break;
            }
            case DELETE:
                
                break;
            case PUT:
                
                break;
            case QUERY_GET:
                
                break;
                
        }
    }else {
        if(response) {
            response(ApiRequestNotReachable, nil);
        }
    }
    
}
//统一处理响应数据
+ (void)handleSuccessRequest:(id)JSON cb:(void(^)(ApiRequestStatusCode requestStatusCode, id JSON))cb {
    APIClient *client = [APIClient sharedInstance];
    if(client.delegate && [client.delegate respondsToSelector:@selector(handleSuccessRequest:completion:)]) {
        [client.delegate handleSuccessRequest:JSON
                                   completion:^(id aJSON) {
                                       if(cb) {
                                           cb(ApiRequestOK, aJSON);
                                       }
                                   }];
    } else {
        if(cb) {
            cb(ApiRequestOK, JSON);
        }
    }
}
+ (NSString *)pathGet:(NSString *)url params:(NSDictionary *)params {
    if(url == nil || params == nil || params.count <= 0) {
        return url;
    }
    for(NSString *key in params) {
        NSString *key2 = [NSString stringWithFormat:@"{%@}", key];
        if([url rangeOfString:key2].location != NSNotFound) {
            url = [url stringByReplacingOccurrencesOfString:key2 withString:params[key]];
        }
    }
    return [url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet characterSetWithCharactersInString:@"`#%^{}\"[]|\\<> "].invertedSet];
}
//取消所有网络请求
+ (void)cancelAllRequest {
    APIClient *client = [APIClient sharedInstance];
    if (client.manager) {
        if (client.manager.operationQueue) {
            [client.manager.operationQueue cancelAllOperations];
        }
    }
}
@end
