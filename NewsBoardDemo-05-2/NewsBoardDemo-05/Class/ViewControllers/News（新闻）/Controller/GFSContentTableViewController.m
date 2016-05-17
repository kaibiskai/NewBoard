
//
//  GFSContentTableViewController.m
//  NewsBoardDemo-05
//
//  Created by Invoter丶C on 16/4/21.
//  Copyright © 2016年 IT. All rights reserved.
//

#import "GFSContentTableViewController.h"

@interface GFSContentTableViewController ()

@end

@implementation GFSContentTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 90, 0);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(40,0,88,0);
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kCellIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@--%ld",self.title,indexPath.row];
    
    return cell;
}


@end
