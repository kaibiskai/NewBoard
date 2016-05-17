//
//  AppDelegate.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
/*
 1、开会 脑海当中 勾勒一下蓝图
 2、搭框架 
      a。tabbarcontroller  (删除vc 和 sb )
             pch 全局导入（不需要导入头文件 那么就可以使用该类的东西 但是 x6 被废弃了 苹果不建议这种用法  拿出来用一下 ）
      b。nav    leftbar  统一返回按钮
      c。vc
      d。tableviewcontroller
 
 */

#import "AppDelegate.h"
#import "GFSTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:kScreenBounds];
    self.window.backgroundColor = kRGBColor(0.4, 0.5, 0.6, 1.0);

    
    // 创建了一个tabbarvc
//    UITabBarController  *tabbar =  [[UITabBarController  alloc] init];
    
    
    //将tabbarvc变成window的跟视图
    self.window.rootViewController = [[GFSTabBarController  alloc] init];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
