//
//  ViewController.m
//  03_截屏
//
//  Created by ImL1s-MacPro on 2016/12/7.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 生成ImageView
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    
    iv.image = [UIImage imageNamed:@"35966-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone-2"];
    
    [self.view addSubview: iv];
    
    // 生成Button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"截圖" forState:UIControlStateNormal];
    button.frame = CGRectMake(50, 50, 200, 50);
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(onClick) forControlEvents:UIControlEventTouchUpInside];
    //    button.titleLabel.textColor = [UIColor blackColor];
    [self.view addSubview:button];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
 
}

- (void) onClick
{
    CGSize size = CGSizeMake([[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
    
    // 開啟一個跟當前螢幕大小一樣大的螢幕
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    // 將當前View渲染到上下文當中
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 取得上下文並轉成圖片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 關閉上下文
    UIGraphicsEndImageContext();
    
    // 產生一個格式為Jpeg的二進制檔案
    NSData *dataGood = UIImageJPEGRepresentation(image, 1);
    NSData *dataBad = UIImageJPEGRepresentation(image, 0);
    // 產生一個格式為Png的二進制檔案
//    NSData *data = UIImagePNGRepresentation(image);
    
    [dataGood writeToFile:@"/Users/iml1s-macpro/Temp/imgGood.jpg" atomically:YES];
    [dataBad writeToFile:@"/Users/iml1s-macpro/Temp/imgBad.jpg" atomically:YES];
//    [data writeToFile:@"/Users/iml1s-macpro/Temp/img.png" atomically:YES];
    
}


@end
