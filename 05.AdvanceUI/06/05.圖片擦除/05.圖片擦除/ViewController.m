//
//  ViewController.m
//  05.圖片擦除
//
//  Created by ImL1s-MacPro on 2016/12/8.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,assign) CGRect mainScreenBound;     // 主螢幕Boudn

@property(nonatomic,strong) UIImageView *imageView1;    // 底下的imageView

@property(nonatomic,strong) UIImageView *imageView2;    // 上層擦除的imageView

@end

@implementation ViewController

- (CGRect)mainScreenBound
{
    return [[UIScreen mainScreen] bounds];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mainScreenBound.size.width, self.mainScreenBound.size.height)];
    
     self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.mainScreenBound.size.width, self.mainScreenBound.size.height)];
    
    UIImage *image1 = [UIImage imageNamed:@"37365s-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    UIImage *image2 = [UIImage imageNamed:@"37690s-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    
    self.imageView1.image = image1;
    self.imageView2.image = image2;
    
    [self.view addSubview:_imageView1];
    [self.view addSubview:_imageView2];
    
    self.imageView2.userInteractionEnabled = YES;
    [self.imageView2 addGestureRecognizer:pan];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

#define clearWidth 30
#define clearWidthHalf clearWidth * 0.5

- (void) onPan:(UIPanGestureRecognizer *)panGR
{
//    NSLog(@"onPan");
    
    // 取得當前在imageView2上滑動的位置
    CGPoint currentPoint = [panGR locationInView:self.imageView2];
    
    // 算出畫筆筆芯的大小
    CGRect clearRect = CGRectMake(currentPoint.x - clearWidthHalf, currentPoint.y - clearWidthHalf, clearWidth, clearWidth);
    
    // 生成個跟imageView2一樣大小的上下文
    UIGraphicsBeginImageContextWithOptions(self.imageView2.bounds.size, NO, 0);
    
    // 取得圖形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 將imageView2的內容渲染到圖形上下文上
    [self.imageView2.layer renderInContext:ctx];
    
    // 向上下文加入一個圓形
    CGContextAddEllipseInRect(ctx, clearRect);
    
    // 將上面的的圓形變成剪裁遮罩
    CGContextClip(ctx);
    
    // 將Rect區域中的像素變成透明
    CGContextClearRect(ctx, clearRect);
    
    // 取得最終圖形
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 關閉上下文
    UIGraphicsEndImageContext();
    
    self.imageView2.image = image;
}


@end
