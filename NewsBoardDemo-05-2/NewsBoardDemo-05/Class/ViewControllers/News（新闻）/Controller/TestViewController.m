//
//  TestViewController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/20.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;
@property (weak, nonatomic) IBOutlet UILabel *loginLabel;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.scrollview.contentSize = CGSizeMake(0, 1500);
    self.scrollview.delegate = self;
//    self.topImageView.backgroundColor = [UIColor blueColor];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    if (scrollView.contentOffset.y >= self.topImageView.height) {
        if (![self.view.subviews containsObject:self.loginLabel]) {
            [self.view addSubview:self.loginLabel];
            self.loginLabel.y = 0;
         }
        } else {
       // NSLog(@"123456789");
        self.loginLabel.y = 160;
        [self.scrollview addSubview:self.loginLabel];
    }
    // -100   1  1  0.01
//    self.topImageView.transform = CGAffineTransformMakeScale(0.5, 0.5);
    CGFloat  offY = scrollView.contentOffset.y;

    if (scrollView.contentOffset.y<=0) {
        CGFloat  scale = 1- (offY/100);
    
//        self.topImageView.y = offY;
         self.topImageView.transform = CGAffineTransformMakeScale(1, scale);
    }
    
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
