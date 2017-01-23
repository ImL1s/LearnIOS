//
//  ViewController.m
//  01.CALayer基本操作
//
//  Created by ImL1s-MacPro on 2016/12/15.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 200, 200)];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 400, 400)];
    [self.view addSubview:redView];
//    [self.view addSubview:view];
    
    CALayer *redLayer = redView.layer;
//    CALayer *layer = view.layer;

    redLayer.backgroundColor = [UIColor redColor].CGColor;
    redLayer.shadowColor = [UIColor blackColor] .CGColor;
    redLayer.shadowOffset = CGSizeMake(10, 10);
    // 陰影透明度
    redLayer.shadowOpacity = 1;
    // 陰影模糊半徑
    redLayer.shadowRadius = 1;
    // 編框(向內)
    redLayer.borderWidth = 10;
    // 邊框顏色
    redLayer.borderColor = [[UIColor yellowColor] CGColor];
    // 模糊
    redLayer.cornerRadius = 50;
    // 裁剪超過根層的渲染
    redLayer.masksToBounds = YES;
    
    redLayer.contents = (__bridge id)[UIImage imageNamed:@"and"].CGImage;
    
    NSLog(@"%@",redView.layer.contents);
    
//    CGImageRef cgImg = [UIImage imageNamed:@"and"].CGImage;
//    layer.contents = (__bridge id) cgImg;
//    
////    layer.contentsGravity = kCAGravityResizeAspect;
//    layer.contentsGravity = kCAGravityCenter;
//    layer.contentsScale = 2.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
