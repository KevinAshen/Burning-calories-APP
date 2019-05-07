//
//  Singleton.h
//  smartapc-ios
//
//  Created by apple on 16/6/20.
//  Copyright © 2016年 list. All rights reserved.
//
#import <UIKit/UIKit.h>
////////////////////////////////////////////////////////////////////////////////
// 申明和定义单例对象:
// AS_SINGLETON( XxxClass );
// DEF_SINGLETON( XxxClass );
#undef	AS_SINGLETON
#define AS_SINGLETON( __class ) \
- (__class *)sharedInstance; \
+ (__class *)sharedInstance;

#undef	DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
- (__class *)sharedInstance \
{ \
    return [__class sharedInstance]; \
} \
+ (__class *)sharedInstance \
{ \
    static dispatch_once_t once; \
    static __class * __singleton__; \
    dispatch_once( &once, ^{ __singleton__ = [[[self class] alloc] init]; } ); \
    return __singleton__; \
}
////////////////////////////////////////////////////////////////////////////////
