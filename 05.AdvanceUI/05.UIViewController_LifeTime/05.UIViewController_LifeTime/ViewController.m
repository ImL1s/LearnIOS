//
//  ViewController.m
//  05.UIViewController_LifeTime
//
//  Created by ImL1s-MacPro on 2016/11/11.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"加載完成");
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"將顯示");
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"完成顯示");
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"將消失");
}

- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"已消失");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    NSLog(@"[%@] %@",NSStringFromClass([self class]) ,@"銷毀");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 顯示所有在Navigation堆棧中子UIViewController的
    NSArray *childControllers = self.navigationController.childViewControllers;
    NSArray *subViewControllers = self.navigationController.viewControllers;
    
    NSLog(@"%@", childControllers);
    NSLog(@"%@", subViewControllers);
}

@end
