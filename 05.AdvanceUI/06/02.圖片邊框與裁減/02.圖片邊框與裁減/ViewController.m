//
//  ViewController.m
//  02.圖片邊框與裁減
//
//  Created by ImL1s-MacPro on 2016/12/6.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Clip.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *iv = [[UIImageView alloc] init];
    iv.frame = CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height);
    UIImage *img = [UIImage imageNamed:@"37365s-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    iv.image = [UIImage imageWithBorder:CGSizeMake(20, 20) color:[UIColor redColor] image:img];
    
    [self.view addSubview:iv];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
