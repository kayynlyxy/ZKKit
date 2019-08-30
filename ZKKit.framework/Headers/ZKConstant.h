//
//  ZKConstant.h
//  MySDK
//
//  Created by 郑凯 on 2019/8/30.
//  Copyright © 2019 郑凯. All rights reserved.
//

#ifndef ZKConstant_h
#define ZKConstant_h

#define ZKNotificationCenter [NSNotificationCenter defaultCenter]
#define ZKApplication        [UIApplication sharedApplication]
#define ZKRootViewController [UIApplication sharedApplication].keyWindow.rootViewController
#define ZKAppWindow [UIApplication sharedApplication].keyWindow
#define ZKUserDefaults       [NSUserDefaults standardUserDefaults]

//状态栏、导航栏、标签栏高度
#define ZKStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define ZKNavBarHeight (kStatusBarHeight + 44.0)
#define ZKTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
#define ZKBottomMargin ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)

//从x个元素中随机取一个
#define ZKRandomNumber(x) arc4random() % x

//DEBUG模式下打印日志
#ifdef DEBUG
#define NSLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])

#else
#define NSLog(...)
#endif

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]

#define ZKImageNamed(format) [UIImage imageNamed:format]

#endif /* ZKConstant_h */
