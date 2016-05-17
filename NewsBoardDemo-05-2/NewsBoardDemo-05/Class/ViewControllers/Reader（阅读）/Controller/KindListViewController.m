//
//  KindListViewController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/20.
//  Copyright © 2016年 IT. All rights reserved.
/*
 view : 连线 file class：     关联一下view 
 
 1.n中方式
 2.细节 block 代理  刷新 数据源
 
 
 */

#import "KindListViewController.h"
#import "DetailedListTableViewController.h"

@interface KindListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic, strong) void(^block)(NSInteger row);


@end

static  NSString  *const kIdentifier = @"kIdentifier";

@implementation KindListViewController

- (void)test {
    NSDictionary  *dic = @{ @"kind":@[@{
                  @"k":@"生活类",
                  @"v":@[
                          @{@"name":@"张三",@"job":@"司机"},
                          @{@"name":@"张四",@"job":@"厨师"},
                          @{@"name":@"张五",@"job":@"嘴子"}
                          ]},@{
                  @"情感类":@[
                          @{@"name":@"小三",@"job":@"自由"},
                          @{@"name":@"郭敬明",@"job":@"作家"},
                          @{@"name":@"韩寒",@"job":@"车手"}
                          ]},@{
                  @"鬼神类":@[
                          @{@"name":@"猫",@"job":@"宠物"},
                          @{@"name":@"钟馗",@"job":@"道士"},
                          @{@"name":@"孙悟空",@"job":@"和尚"}
                          ]}
                      ]
                  };
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
    
    DetailedListTableViewController *deList = [[DetailedListTableViewController alloc] initWithStyle:UITableViewStylePlain];
    
    [self addChildViewController:deList];
    [self.view addSubview:deList.view];
    
    deList.view.frame = CGRectMake(120, 0, kScreenWidth - 120, kScreenHeight);

  
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}
- (UITableViewCell  *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld行",indexPath.row];
    
    return cell;
}

//  代理  block
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.block) {
        self.block(indexPath.row);
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
