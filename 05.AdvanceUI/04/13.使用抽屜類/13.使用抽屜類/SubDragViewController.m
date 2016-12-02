//
//  SubDragViewController.m
//  13.使用抽屜類
//
//  Created by ImL1s-MacPro on 2016/11/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "SubDragViewController.h"


@interface SubDragViewController ()

@end

@implementation SubDragViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITableViewController *tableController = [[UITableViewController alloc] init];
    [self.blueMainView addSubview:tableController.view];
    self.blueMainView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
