//
//  NewViewController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "NewViewController.h"
#import "TestViewController.h"
#import "GFSContentTableViewController.h"

@interface NewViewController ()<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView   *midScrollView ;
@property (nonatomic, retain) UIScrollView   *topScrollView ;


@end


static   CGFloat  const kCellH = 30.0f;
static  NSString     * const  kCellId = @"c";


@implementation NewViewController

int a = 20;// 全局变量
const int b = 20;//全局常量
static int c = 20; // 静态全局变量
static const int d = 20;//静态全局常量



//int e = 30;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    //导航条改成红色
//    self.navigationController.navigationBar.barTintColor = kRGBColor(1, 0, 0, 1.0);
    self.view.backgroundColor = kRGBColor(0.9, 0.9, 0.9, 1.0);
    self.automaticallyAdjustsScrollViewInsets = NO;

    //initWithImage 创建的imageview 如果不设置大小 imageView默认 和 image的大小一样
    UIImageView  *titleImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"contentview_hd_loading_logo.png"]];
    titleImageView.height = 30;
    
    self.navigationItem.titleView = titleImageView;
    
    //设置左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"搜索" imageNamed:@"search_icon" addTarget:self sel:@selector(leftBarButtonClick:)];
    
    
  
    [self setupChildVC];
    [self setupContentScrollView];
    [self setupTopScrollView];
    

    
}
- (void)leftBarButtonClick:(UIButton *)item {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

- (void)setupChildVC {
    NSArray  *arr = @[@"头条",@"娱乐",@"郑州",@"体育",@"财经",@"时尚",@"科技",@"汽车"];
    for (int i=0; i<arr.count; i++) {
        GFSContentTableViewController *vc = [[GFSContentTableViewController alloc] init];
        vc.title = arr[i];
        [self addChildViewController:vc];
    }
}
// 创建上面的scrollview
- (void)setupTopScrollView {
    
    UIScrollView  *topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    topScrollView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
   topScrollView.showsHorizontalScrollIndicator = NO; //topscrollview的子视图之一
    topScrollView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:topScrollView];
    
    for (int i=0; i<self.childViewControllers.count; i++) {
        UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(titleWidth*i, 0, titleWidth, titleWidth/2);
        [button setTitle:[self.childViewControllers[i] title] forState:UIControlStateNormal];
                    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (0==i) {
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
        button.tag = i ;
        [button addTarget:self action:@selector(topButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [topScrollView addSubview:button];
    }
    topScrollView.contentSize = CGSizeMake(80*8, 0);
//    topScrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.topScrollView = topScrollView;

}
/**
 * 创建中间的scrollview
 */
- (void)setupContentScrollView {
    
    UIScrollView  *midScrollView = [[UIScrollView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    midScrollView.backgroundColor = kRGBColor(0.9, 0.9, 0.9, 1);
    [self.view addSubview:midScrollView];
    
    midScrollView.contentSize = CGSizeMake(8*kScreenWidth, 0);
    midScrollView.pagingEnabled = YES;
    midScrollView.delegate = self;
    
    [self scrollViewDidEndScrollingAnimation:midScrollView];
    
    self.midScrollView = midScrollView;
}

- (void)topButtonClick:(UIButton *)sender {
    //UIViewController 因为不一定全都是tabvc
    [self.midScrollView setContentOffset:CGPointMake(sender.tag*kScreenWidth, 0) animated:YES];
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    // 获取索引
    NSUInteger  index = scrollView.contentOffset.x/kScreenWidth;
    UIViewController  *vc = self.childViewControllers[index];
//    if ([vc isViewLoaded]) {
//        return ;
//    }
    
    [scrollView addSubview:vc.view];
    
    vc.view.x = scrollView.contentOffset.x;
    vc.view.y = 0.0;
    
    // 1获取中心点x坐标
    CGFloat  centerX  = [self.topScrollView.subviews[index] center].x ;
    
    CGFloat  offsetX = centerX - (kScreenWidth/2.0);
    if (offsetX<=0) {
        offsetX = 0;
    }
    if (offsetX >= self.topScrollView.contentSize.width-kScreenWidth) {
        offsetX = self.topScrollView.contentSize.width-kScreenWidth;
    }
    
    [self.topScrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}
//停止减速 必须用户手动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取当前的按钮
//    NSLog(@"%f",scrollView.contentOffset.x/kScreenWidth);
    CGFloat   offWidth = scrollView.contentOffset.x/kScreenWidth;
    
    NSInteger  leftIndex = offWidth;
    NSInteger  rightIndex = leftIndex + 1;
    
    CGFloat    rightScale = offWidth - leftIndex;
    CGFloat    leftScale = 1- rightScale;
    
    UIButton  *leftButton = self.topScrollView.subviews[leftIndex];
    [leftButton setTitleColor:kRGBColor(leftScale, 0, 0, 1 ) forState:UIControlStateNormal];
    leftButton.transform = CGAffineTransformMakeScale(1 + leftScale/2, 1 + leftScale/2);
    
    
    if (rightIndex >=self.topScrollView.subviews.count ) {
        return;
    }
    UIButton  *rightButton = self.topScrollView.subviews[rightIndex];
    [rightButton setTitleColor:kRGBColor(rightScale, 0, 0, 1 ) forState:UIControlStateNormal];

    rightButton.transform = CGAffineTransformMakeScale(1 + rightScale/2, 1 + rightScale/2);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
