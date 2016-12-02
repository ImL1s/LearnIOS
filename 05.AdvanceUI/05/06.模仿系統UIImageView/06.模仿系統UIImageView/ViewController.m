//
//  ViewController.m
//  06.模仿系統UIImageView
//
//  Created by ImL1s-MacPro on 2016/11/29.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "MyImageView.h"

@interface ViewController ()

@property(nonatomic,strong) NSArray *imageNameArray;

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imageNameArray = @[@"35957-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone",@"31598-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone-2"];
//    MyImageView *mIV = [self myImageViewWithAllocInit];
    MyImageView *mIV = [self myImageViewWithInitWithImage];
    
    [self.view addSubview:mIV];
    
}

// 使用一般的init來設定image
- (MyImageView *)myImageViewWithAllocInit
{
    MyImageView *mIV = [[MyImageView alloc] init];
    mIV.backgroundColor = [UIColor grayColor];
    mIV.frame = CGRectMake(0, 0, 100, 300);
    mIV.image = [UIImage imageNamed:@"35957-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    mIV.imageScaleMode = ImageScaleModeFitWithWidth;
    
    return mIV;
}

// 使用initWithImage方法(自動根據圖案大小，創建相同大小的ImageView)
- (MyImageView *)myImageViewWithInitWithImage
{
    return [[MyImageView alloc]  initWithImage:[UIImage imageNamed:@"35957-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 點擊切換圖片
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int index = 0;
    
    MyImageView *mIV = self.view.subviews[2];
    mIV.image = [UIImage imageNamed:self.imageNameArray[++index%2]];
}

@end
