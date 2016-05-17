//
//  GFSTabBarController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "GFSTabBarController.h"
#import "GFSNavigationController.h"
#import "NewViewController.h"
#import "ReaderViewController.h"
#import "MediaViewController.h"
#import "FoundViewController.h"
#import "MeViewController.h"

@interface GFSTabBarController ()

@end

@implementation GFSTabBarController
+ (void)initialize {
    NSDictionary  *noDic = @{
                             NSFontAttributeName:[UIFont systemFontOfSize:14],
                             NSForegroundColorAttributeName:[UIColor  darkGrayColor]
                             };
    NSDictionary  *selDic = @{
                              NSFontAttributeName:[UIFont systemFontOfSize:14],
                              NSForegroundColorAttributeName:[UIColor  redColor]
                              };
    //UI_APPEARANCE_SELECTOR  外表 出现 一但遇到该标记  表示其属性或方法 可以同一设定 设定
    UITabBarItem  *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:noDic forState:UIControlStateNormal];
    
    [item setTitleTextAttributes:selDic forState:UIControlStateSelected];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // alloc开辟内存空间  init初始化属性 但是 只执行这两个 不会生成view newsvc.view 有值吗 什么时候有值 当需要展示view的时候 view 懒加载
    
    NewViewController  *newsVC = [[NewViewController alloc] init];
    
    [self setupChildVC:newsVC withTitle:@"新闻" imageNamed:@"tabbar_icon_news_normal" selectedNamed:@"tabbar_icon_news_highlight"];
   
    
    ReaderViewController  *readerVC = [[ReaderViewController alloc] init];
    [self setupChildVC:readerVC withTitle:@"阅读" imageNamed:@"tabbar_icon_reader_normal" selectedNamed:@"tabbar_icon_reader_highlight"];
  
    
    MediaViewController  *mediaVC = [[MediaViewController alloc] init];
    [self setupChildVC:mediaVC withTitle:@"视频" imageNamed:@"tabbar_icon_media_normal" selectedNamed:@"tabbar_icon_media_highlight"];
    
    FoundViewController  *foundVC = [[FoundViewController alloc] init];
    [self setupChildVC:foundVC withTitle:@"话题" imageNamed:@"tabbar_icon_bar_normal" selectedNamed:@"tabbar_icon_bar_highlight"];
   
    MeViewController  *meVC = [[MeViewController alloc] init];
    [self setupChildVC:meVC withTitle:@"我" imageNamed:@"tabbar_icon_me_normal" selectedNamed:@"tabbar_icon_me_highlight"];
    
    
    
//    vc1.view.backgroundColor = [UIColor redColor];
//    vc1.tabBarItem.title = @"新闻";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_icon_news_normal"];
//    vc1.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_icon_news_highlight"];
//    [self addChildViewController:vc1];
    // 方案1
//    UIImage  *image = [UIImage imageNamed:@"tabbar_icon_news_highlight"];
//    vc1.tabBarItem.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
   //UIImageRenderingModeAlwaysOriginal 使用原始图片 不处理
    // 方案2  assets -->tool
  
    
    //字 大小
//    [vc1.tabBarItem setTitleTextAttributes:noDic forState:UIControlStateNormal];
//    
//    [vc1.tabBarItem setTitleTextAttributes:selDic forState:UIControlStateSelected];
    

//    
//    UIViewController  *vc2 = [[UIViewController alloc] init];
//    vc2.tabBarItem.title = @"阅读";
//    
////    [vc2.tabBarItem setTitleTextAttributes:noDic forState:UIControlStateNormal];
////    [vc2.tabBarItem setTitleTextAttributes:selDic forState:UIControlStateSelected];
//    
//    vc2.view.backgroundColor = [UIColor greenColor];
//    [self addChildViewController:vc2];
}
/**
 * 封装 配置 vc的方法
 */
- (void)setupChildVC:(UIViewController *)vc  withTitle:(NSString  *)title  imageNamed:(NSString  *)normalName  selectedNamed:(NSString  *)selectedName{
    //  此处一定不能设背景颜色 可以测试的时候用 
    //vc.view.backgroundColor = [UIColor redColor];
    // window 黑的  nav 透明 vc 透明  白的？xib
    // 项目优化 透明
    vc.navigationItem.title = title;
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    GFSNavigationController  *nav = [[GFSNavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
