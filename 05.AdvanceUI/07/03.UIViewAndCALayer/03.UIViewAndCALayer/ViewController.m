//
//  ViewController.m
//  03.UIViewAndCALayer
//
//  Created by ImL1s-MacPro on 2016/12/20.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
    view.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:view];
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
   
    UIImage *image = [UIImage imageNamed:@"31283s-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    layer.contents = (id)image.CGImage;
    
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    NSLog(@"%f %f",width,height);
    
    // 將圖片等比例縮放至View的寬度
    CGSize viewSize = self.view.frame.size;
    CGFloat multiple = viewSize.width / width;
    
    CGFloat lastWidth = width * multiple;
    CGFloat lastHeight = height * multiple;
    
    layer.frame = CGRectMake(0, 0, lastWidth, lastHeight);
    
    [view.layer addSublayer:layer];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}


@end
