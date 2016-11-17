//
//  ThreeViewController.m
//  3.NavigationController_InCOde
//
//  Created by ImL1s-MacPro on 2016/11/10.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ThreeViewController.h"

@interface ThreeViewController ()
- (IBAction)goToOneView;

- (IBAction)onGotoOneClick;

@end

@implementation ThreeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 設定自定義的返回按鈕
    UIButton *btn = [[UIButton alloc] init];
    btn.bounds = CGRectMake(0, 0, 46, 31);
    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    
    // UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.leftBarButtonItem = item;
}

- (void)didReceiveMemoryWarning
{
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

- (void) back
{
    [self.navigationController popViewControllerAnimated:YES];
}

// 直接回到root控制器
- (IBAction)goToOneView {
}

- (IBAction)onGotoOneClick
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
