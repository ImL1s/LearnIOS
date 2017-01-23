//
//  ViewController.m
//  08.UIApplication
//
//  Created by yushanglung on 2016/10/8.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)onCleanBtnClick:(id)sender
{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIApplication *app = [UIApplication sharedApplication];
    
    // 讓statusbar顯示/不顯示網路等待提示
    app.networkActivityIndicatorVisible = !app.networkActivityIndicatorVisible;
    
    // 設定當前顯示的StatusBarStyle:
    //默認情況下當前的StatusBarStyle是由ViewController控制的,如果要用UIApplication控制當前StatusBar,必須到info.plist文件中設定(UI)ViewControllerBasedStatusBarAppearance ＝ NO
//    app.statusBarStyle = UIStatusBarStyleLightContent;
    
    
    // 更改桌面圖標數量顯示
    app.applicationIconBadgeNumber = 15;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
