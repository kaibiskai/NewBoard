//
//  ReaderViewController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/19.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "ReaderViewController.h"
#import "KindListViewController.h"

@interface ReaderViewController ()

@end

@implementation ReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%s",__func__);    //设置左边的按钮
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:nil imageNamed:@"top_navigation_readerplus" addTarget:self sel:@selector(rightBarButtonClick:)];

}
- (void)rightBarButtonClick:(UIButton *)sender {
    
    [self.navigationController pushViewController:[KindListViewController new] animated:YES];
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
