//
//  ViewController.m
//  01.簡單圖形裁剪
//
//  Created by ImL1s-MacPro on 2016/12/6.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"35957-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    CGFloat imageWidth = image.size.width;
    
    CGFloat mut = [[UIScreen mainScreen] bounds].size.width / image.size.width;
    
    // 放置一個全螢幕的ImageView(將寬度調整至螢幕寬度,並且根據比例調整高度)
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, image.size.height * mut)];
    
    [self.view addSubview:imgView];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 畫出裁剪框
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width ,image.size.height)];
    
    [path addClip];
//    [path fill];
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    imgView.image = resultImage;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    
}


@end
