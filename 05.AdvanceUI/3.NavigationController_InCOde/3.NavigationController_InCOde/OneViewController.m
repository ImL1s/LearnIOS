//
//  OneViewController.m
//  3.NavigationController_InCOde
//
//  Created by ImL1s-MacPro on 2016/11/10.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"

@interface OneViewController ()

- (IBAction)onClickTwoControllerBtn;

@end

@implementation OneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 兩種設定標題的方法
    self.navigationItem.title = @"第一個標題1";
//    self.title = @"第一個標題";
    
    // 自定義導航欄按鈕
    UIBarButtonItem *leftBarButton1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];
    
    UIBarButtonItem *leftBarButton2 = [[UIBarButtonItem alloc]   initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    
    // self.navigationItem.leftBarButtonItem = leftBarButton1;
    self.navigationItem.leftBarButtonItems = @[leftBarButton1,leftBarButton2];
    
    
    // 設定返回到此Controller時的返回按鈕(下一個ViewController的返回按鈕)
    UIBarButtonItem *backBarBtn = [[UIBarButtonItem alloc] initWithTitle:@"回去!" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    self.navigationItem.backBarButtonItem = backBarBtn;
    
    //通過下面的方法沒法設置
    //   UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_back_normal"] style:UIBarButtonItemStylePlain target:nil action:nil];
    
    //self.navigationItem.backBarButtonItem = item;
    
    //自動義按鈕設置在返回按鈕是無效
    //    UIButton *btn = [[UIButton alloc] init];
    //    btn.bounds = CGRectMake(0, 0, 46, 31);
    //    [btn setBackgroundImage:[UIImage imageNamed:@"btn_back_normal"] forState:UIControlStateNormal];
    //
    //    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:btn];
    //    self.navigationItem.backBarButtonItem = item;
    
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

// 跳轉到第二個Controller
- (IBAction)onClickTwoControllerBtn
{
    TwoViewController *twoController = [[TwoViewController alloc] init];
    
    [self.navigationController pushViewController:twoController animated:YES];
    
    
    
}
@end
