//
//  MyViewController.m
//  2.CteateController
//
//  Created by yushanglung on 2016/10/9.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)loadView
{
//    [super loadView];
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 60)];
//    [btn setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
//    self.view = btn;
    
    self.view = [[UITableView alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
