//
//  ViewController.m
//  05.NSThread
//
//  Created by ImL1s-MacPro on 2016/10/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    [self createThreadOne];
    [self createThreadTwo];
    [self createThreadThree];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 建立一個執行緒-方式1
- (void) createThreadOne
{
    NSThread *t = [[NSThread alloc] initWithTarget:self selector:@selector(run) object:nil];
    [t start];
}

// 建立一個執行緒-方式2
- (void) createThreadTwo
{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"Hello"];
}

// 建立一個執行緒-方式3
- (void) createThreadThree
{
    [self performSelectorInBackground:@selector(run:) withObject:@"World"];
}

// 執行緒操作
- (void) run:(NSString *)str
{
    if(str != NULL) NSLog(@"%@",str);
    
    //    for(int i = 0; i < 20000; i++)
    //    {
    //        NSLog(@"%@%d",[NSThread currentThread],i);
    //    }
}


@end
