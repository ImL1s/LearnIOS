//
//  YSPersonalTableViewController.m
//  06-08.個人詳情頁
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSPersonalTableViewController.h"

@interface YSPersonalTableViewController ()


@end

@implementation YSPersonalTableViewController

static NSString *cellID = @"cell";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 註冊tableCell(可以用來自定義Cell),可以搭配tableView: dequeueReusableCellWithIdentifier: indexPath: 使用
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
    
    // 將navagationBar背景變成透明
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    // 設定導航條/導航條上的控件的透明度是沒有用的
    self.navigationController.navigationBar.alpha = 0.5;
    
    // 取消navagationBar下面的陰影
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    // 輸出 {0 0 0 0}
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // 輸出 {64 0 0 0},在導航條下面的scrollView默認會設定 {64 0 0 0}的偏移量
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.tableView.contentInset));
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    
    cell.textLabel.text = @"A";
    cell.detailTextLabel.text = @"B";
    
    NSLog(@"%p",&cell);
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
