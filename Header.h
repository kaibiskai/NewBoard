//
//  Header.h
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#ifndef Header_h
#define Header_h

/**
 * debug状态下的NSLog 哈哈哈
 */
#ifdef  DEBUG
#define GFSLog(...)    NSLog(__VA_ARGS__)
#else
#define GFSLog(...)
#endif
/**
 * 屏幕 宽高
 */
#define  kScreenBounds  [[UIScreen mainScreen] bounds]
#define  kScreenHeight  kScreenBounds.size.height
#define  kScreenWidth  kScreenBounds.size.width
/*
 * 颜色
 */
#define kRGBColor(r,g,b,a)      [UIColor colorWithRed:(r) green:(g) blue:(b) alpha:(a)]



#endif /* Header_h */





