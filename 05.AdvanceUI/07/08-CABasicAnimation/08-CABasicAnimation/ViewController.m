//
//  ViewController.m
//  08-CABasicAnimation
//
//  Created by ImL1s-MacPro on 2017/1/10.
//  Copyright © 2017年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) UIView *redView;

@end

@implementation ViewController

- (UIView *)redView
{
    if(_redView == nil)
    {
        _redView = [[UIView alloc] init];
        _redView.bounds = CGRectMake(100, 100, 100, 100);
        _redView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_redView];
    }
    return _redView;
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
    CABasicAnimation *animation = [CABasicAnimation animation];
    
    animation.keyPath = @"position.x";
    animation.fillMode = kCAFillModeForwards;
//    animation.fillMode = @"forwards";
    animation.removedOnCompletion = NO;
    animation.toValue = @300;
    
    [self.redView.layer addAnimation:animation forKey:nil];
}

@end
