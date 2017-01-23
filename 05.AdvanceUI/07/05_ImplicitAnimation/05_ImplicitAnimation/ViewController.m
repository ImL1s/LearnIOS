//
//  ViewController.m
//  05_ImplicitAnimation
//
//  Created by ImL1s-MacPro on 2016/12/22.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];

    self.view.layer.backgroundColor = [UIColor redColor].CGColor;
    CALayer *layer = [CALayer layer];
    [self.view.layer addSublayer:layer];
    
    layer.frame = CGRectMake(0, 0, 150, 150);
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    CALayer *layer = self.view.layer.sublayers[2];
    

    [CATransaction setDisableActions:YES];
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.position = CGPointMake(touchPoint.x, touchPoint.y);

}

@end
