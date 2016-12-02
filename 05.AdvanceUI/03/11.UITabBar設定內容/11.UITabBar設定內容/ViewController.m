//
//  ViewController.m
//  11.UITabBar設定內容
//
//  Created by ImL1s-MacPro on 2016/11/19.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rect = [[UIScreen mainScreen] bounds];
    UITableView *table = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    
    [self.view addSubview:table];
    table.delegate = self;
    table.dataSource = self;
    
    [table registerClass:[UITableViewCell class] forCellReuseIdentifier:@"id"];
    
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Table"];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Table2"];
    [[self.tabBarController.tabBar.items objectAtIndex:0] setBadgeValue:[NSString stringWithFormat:@"%ld",(long)[UIApplication sharedApplication].applicationIconBadgeNumber]];
//    [[self.tabBarController.tabBar.items objectAtIndex:0] setTitle:@"Table2"];

//    self.tabBarItem.badgeValue = @"表格";
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"rows");
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"id" forIndexPath:indexPath];
    
    cell.textLabel.text = @"a";
    
    return cell;
}


@end
