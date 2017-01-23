//
//  ViewController.m
//  04.指定截屏
//
//  Created by ImL1s-MacPro on 2016/12/7.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 當前擷取狀態ENUM
typedef NS_ENUM(NSInteger,ClipStateType)
{
    ClipStateIdle = 0,
    ClipStateFocus = 1,
    ClipStateCliped = 2
};

@property(nonatomic,strong) UIImageView *imageView;

// 使用weak,讓他自動從父View移除後自動銷毀.
@property(nonatomic,weak) UIView *maskView;

@property(nonatomic,weak) UIButton *yesBtn;

@property(nonatomic,weak) UIButton *noBtn;

// 原始圖案
@property(nonatomic,strong) UIImage *originalImg;

// 當前擷取狀態
@property(nonatomic,assign) ClipStateType clipStateType;

@end

@implementation ViewController

#pragma mark - static field

static CGPoint startPoint;
static CGFloat xDistance;
static CGFloat yDistance;
static CGRect clipRect;

static UIColor *focusColor;



#pragma mark - get/set

- (UIView *)maskView
{
    if(_maskView == nil)
    {
        UIView *maskView = [[UIView alloc] init];
        _maskView = maskView;
        _maskView.backgroundColor = focusColor;
        [self.imageView addSubview:_maskView];
    }
    
    return _maskView;
}


- (UIImage *) originalImg
{
    if(_originalImg == nil)
    {
        _originalImg = [UIImage imageNamed:@"35690-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone-2"];
    }
    
    return _originalImg;
}

#pragma mark - UIViewController method

- (void)viewDidLoad
{
    [super viewDidLoad];
    focusColor = [[UIColor alloc] initWithWhite:0 alpha:0.5f];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];

    self.imageView.image = self.originalImg;
                                                                    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGR:)];
    
    [self.imageView setGestureRecognizers:@[panGR]];
    
    self.imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:self.imageView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


#pragma mark - my method


- (void) onPanGR:(UIPanGestureRecognizer *)panGR
{
//    NSLog(@"onPanGR");

    if(self.clipStateType != ClipStateIdle) return;
    
    switch (panGR.state)
    {
            // 當開始滑動時
        case UIGestureRecognizerStateBegan:
            
            startPoint = [panGR locationInView:self.view];

            break;
        
            // 滑動中
        case UIGestureRecognizerStateChanged:
            
            xDistance = [panGR locationInView:self.view].x - startPoint.x;
            yDistance = [panGR locationInView:self.view].y - startPoint.y;
            
            clipRect= CGRectMake(startPoint.x, startPoint.y, xDistance, yDistance);

            self.maskView.frame = clipRect;

            break;
            
            // 滑動結束
        case UIGestureRecognizerStateEnded:
            
            [self.maskView removeFromSuperview];
            [self focusImage:clipRect];

            break;
            
            default:

            break;
    }
    
}

// 聚焦狀態,等待用戶進一步操作
- (void) focusImage:(CGRect)clipRect
{
    self.clipStateType = ClipStateFocus;
    
    UIGraphicsBeginImageContextWithOptions(self.imageView.frame.size, NO, 0);
    
    UIBezierPath *screenPath = [UIBezierPath bezierPathWithRect:[UIScreen mainScreen].bounds];
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:clipRect];
    
    // 設定背後沒選中較暗的地方
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    [focusColor set];
    [screenPath fill];
    
    // 設定聚焦的地方
    [clipPath addClip];
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageView.image = resultImage;
    
    [self createClipSelectButton:clipRect.origin];

}

// 真正的截取Image
- (void) clipImage:(CGRect)clipRect
{
    self.clipStateType = ClipStateCliped;
    
    UIGraphicsBeginImageContextWithOptions(self.imageView.frame.size, NO, 0);
    
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:clipRect];
    
    [clipPath addClip];
    
    [self.imageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    self.imageView.image = resultImage;
}

- (void) cleanImage
{
//    UIGraphicsBeginImageContextWithOptions(self.imageView.frame.size, NO, 0);
    self.clipStateType = ClipStateIdle;
    self.imageView.image = self.originalImg;
}

// 創造選擇按鈕
- (void) createClipSelectButton:(CGPoint)point
{
    UIButton *yesBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    UIButton *noBtn  = [UIButton buttonWithType:UIButtonTypeSystem];
    
    yesBtn.tag = 1;
    noBtn.tag = 0;
    
    yesBtn.frame = CGRectMake(point.x, point.y, 50, 25);
    noBtn.frame = CGRectMake(point.x + 51, point.y, 50, 25);
    
    [yesBtn setTitle:@"OKV" forState:UIControlStateNormal];
    [noBtn setTitle:@"NOX" forState:UIControlStateNormal];
    
    [yesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [noBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [yesBtn setBackgroundColor:[UIColor whiteColor]];
    [noBtn setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:yesBtn];
    [self.view addSubview:noBtn];
    
    [yesBtn addTarget:self action:@selector(onClickClipBtn:) forControlEvents:UIControlEventTouchUpInside];
    [noBtn addTarget:self action:@selector(onClickClipBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.yesBtn = yesBtn;
    self.noBtn = noBtn;
}

// 按下是否截取的按鈕
- (void) onClickClipBtn:(UIButton *)btn
{
    // 按下確定剪裁按鈕
    if(btn.tag == 1)
    {
        [self clipImage: clipRect];
    }
    else
    {
        [self.yesBtn removeFromSuperview];
        [self.noBtn removeFromSuperview];
        [self cleanImage];
    }
}

@end
