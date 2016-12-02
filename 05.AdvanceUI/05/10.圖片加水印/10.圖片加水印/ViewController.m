//
//  ViewController.m
//  10.圖片加水印
//
//  Created by ImL1s-MacPro on 2016/12/2.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"31283s-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    
    UIImageView *imageView = [self createImageView:image];
    
    // 在上下文中創造一個指定的Image
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(image.size.width, image.size.height), NO, 0);
    
    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 字型
    UIFont *font=[UIFont fontWithName:@"Arial" size:50];
    NSDictionary *dictAttr0 = @{NSFontAttributeName:font};

   
    // 畫字
     NSString *str = @"Made By Eamily";
    [str drawAtPoint:CGPointMake(imageView.frame.size.width / 2, imageView.frame.size.height / 2) withAttributes:dictAttr0];
    
   
    UIImage *nImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    imageView.image = nImage;
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (UIImageView *)createImageView:(UIImage *)image
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    //    CGFloat value = (screenRect.size.width / image.size.width);
    CGFloat value = (screenRect.size.height / image.size.height);
    CGFloat x = image.size.width * value;
    CGFloat y = image.size.height * value;
    
    // 根據高度自適應ImageView,如果根據寬度的話圖片的長度會超過視窗大小
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, x, screenRect.size.height)];
    
    [self.view addSubview:imageView];
    
    return imageView;
}


@end
