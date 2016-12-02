//
//  ViewController.m
//  01.Quartz簡單繪製
//
//  Created by ImL1s-MacPro on 2016/11/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DrawView *dv = [[DrawView alloc] init];
    dv.frame = [[UIScreen mainScreen] bounds];
    dv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:dv];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
