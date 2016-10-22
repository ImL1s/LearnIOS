//
//  ViewController.m
//  01.Concept
//
//  Created by yushanglung on 2016/10/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self logCurrentState:-1];
    
}

//當觸碰到本Controller時調用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self doLongOperation];
}

// 打印當前執行緒和函數名
- (void)logCurrentState:(NSInteger *)index
{
    NSLog(@"Current Function: %s, Current Thread: %@ ,Index: %ld",__func__,[NSThread currentThread],index);
}

// 模擬一個耗時很長的操作
- (void)doLongOperation
{
    for (int i; i < 20000; i++)
    {
        [self logCurrentState:i];
    }
}

@end
