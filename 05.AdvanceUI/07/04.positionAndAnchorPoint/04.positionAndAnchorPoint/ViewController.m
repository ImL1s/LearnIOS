//
//  ViewController.m
//  04.positionAndAnchorPoint
//
//  Created by ImL1s-MacPro on 2016/12/21.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(strong,nonatomic) CALayer *layer;

@property(strong,nonatomic) UIView *mView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.layer = [CALayer layer];
    
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(20, 20);
    self.layer.anchorPoint = CGPointZero;
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [self.view.layer addSublayer:self.layer];
    
    
    self.mView = [[UIView alloc] init];
    self.mView.frame = CGRectMake(200, 200, 100, 100);
    self.mView.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.mView];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.layer.anchorPoint = CGPointMake(1, 1);
    
    NSLog(@"%@",NSStringFromCGPoint(self.mView.center));
    NSLog(@"%@",NSStringFromCGPoint(self.mView.layer.position));
    NSLog(@"%@",NSStringFromCGRect(self.mView.frame));
    NSLog(@"%f",(self.mView.layer.frame.origin.x - self.mView.layer.frame.size.width * 0.5));
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(self.mView.center.x, self.mView.center.y, 20, 20)];
    v.backgroundColor = [UIColor cyanColor];
    v.layer.anchorPoint = CGPointMake(0.5, 0.5);
    v.layer.position = self.mView.center;
    [self.view addSubview:v];
    
    self.mView.layer.anchorPoint = CGPointMake(1, 1);
}

@end
