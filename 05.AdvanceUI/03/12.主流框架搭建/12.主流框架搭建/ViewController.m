//
//  ViewController.m
//  12.主流框架搭建
//
//  Created by ImL1s-MacPro on 2016/11/19.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.backBtn addTarget:self action:@selector(onBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) onBtnClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
