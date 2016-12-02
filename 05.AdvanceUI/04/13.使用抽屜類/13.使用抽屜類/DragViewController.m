//
//  DragViewController.m
//  13.使用抽屜類
//
//  Created by ImL1s-MacPro on 2016/11/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "DragViewController.h"

#define maxY 100 // mainView 最高的Ｙ值
#define manViewMargin 30
#define targetR [[UIScreen mainScreen] bounds].size.width - manViewMargin     // 右邊pin的位置
#define targerL -([[UIScreen mainScreen] bounds].size.width - manViewMargin)    // 左邊pin的位置

@interface DragViewController ()

@end

@implementation DragViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initView];
}

- (void) initView
{
    _rightRedView = [self viewWithColor:[UIColor redColor]];
    _leftYellowView = [self viewWithColor:[UIColor yellowColor]];
    _blueMainView = [self viewWithColor:[UIColor blueColor]];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.blueMainView addGestureRecognizer:panGR];
    [self.blueMainView addGestureRecognizer:tapGR];
}

- (UIView *) viewWithColor:(UIColor *)color
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = color;
    view.frame = [[UIScreen mainScreen] bounds];
    view.userInteractionEnabled = YES;
    [self.view addSubview:view];
    
    return view;
}

//
- (void) onPan:(UIPanGestureRecognizer *)panGR
{
    CGPoint tpoint = [panGR translationInView:self.blueMainView];
    
    self.blueMainView.frame = [self frameWithOffsetX:tpoint.x];
    //    self.blueMainView.transform = CGAffineTransformTranslate(self.blueMainView.transform, tpoint.x, tpoint.y);
    //
    //    self.blueMainView.transform = CGAffineTransformScale(self.blueMainView.transform, 0.999, 0.999);
    NSLog(@"%@",NSStringFromCGRect(self.blueMainView.frame));
    [panGR setTranslation:CGPointZero inView:self.blueMainView];
    [self setOtherViewVisible];
    [self autoPin:panGR];
    
    NSLog(@"onPan");
}

// 當點擊時
- (void) onTap:(UITapGestureRecognizer *)tapGR
{
    if(self.blueMainView.frame.origin.y <= maxY)
    {
        CGFloat offsetX = 0 - self.blueMainView.frame.origin.x;
        
        [UIView animateWithDuration:0.5 animations:^{
          
            self.blueMainView.frame = [self frameWithOffsetX:offsetX];
            
        }];
    }
}



// 根據X軸滑動給出CGRect
- (CGRect) frameWithOffsetX:(CGFloat)offsetX
{
    CGRect rect = self.blueMainView.frame;
    rect.origin.x += offsetX;
    
    // 根據x軸滑動的距離,縮放View的高
    // IPhone 6s: 375 * 100 / 375
    // IPhone 6s plue: 414 * 100 / 414
    CGFloat y = fabs(rect.origin.x * maxY / [[UIScreen mainScreen] bounds].size.width);
    
    NSLog(@"BlueMainView: %@",NSStringFromCGRect(self.blueMainView.frame));
    NSLog(@"UIMainScreen: %@",NSStringFromCGRect([[UIScreen mainScreen] bounds]));
    rect.origin.y = y;
    
    // 螢幕高度減去兩倍的Y值,才會有縮放的效果
    rect.size.height = [[UIScreen mainScreen] bounds].size.height - y*2;
    
    return rect;
}

// 根據mainView滑動的位置,設定背後的View顯示
- (void) setOtherViewVisible
{
    if(self.blueMainView.frame.origin.x > 0)
    {
        self.leftYellowView.hidden = YES;
    }
    else if(self.blueMainView.frame.origin.x < 0)
    {
        self.leftYellowView.hidden = NO;
    }
}



- (void) autoPin:(UIGestureRecognizer *)panGR
{
    // 當前為手指鬆開狀態
    if(panGR.state == UIGestureRecognizerStateEnded)
    {
        CGFloat target = 0;
        CGFloat mainViewMaxX = CGRectGetMaxX(self.blueMainView.frame);
        
        // 如果當前mainView的x位置 > 螢幕寬度的一半
        if(self.blueMainView.frame.origin.x > [[UIScreen mainScreen] bounds].size.width * 0.5)
        {
            target = targetR;
        }
        // 如果當前mainView的最大x位置 < 螢幕的一半
        else if(mainViewMaxX < [[UIScreen mainScreen] bounds].size.width * 0.5)
        {
            target = targerL;
        }
        
        // 取得pin點到當前位置的距離
        CGFloat offsetX = target - self.blueMainView.frame.origin.x;
        
        // 將當前位置動畫到目標位置(使用上面取得的偏移量)
        [UIView animateWithDuration:0.5 animations:^{
            
            self.blueMainView.frame = [self frameWithOffsetX:offsetX];
            
        }];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
