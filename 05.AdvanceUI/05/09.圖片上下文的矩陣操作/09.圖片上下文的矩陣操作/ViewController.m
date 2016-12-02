//
//  ViewController.m
//  09.圖片上下文的矩陣操作
//
//  Created by ImL1s-MacPro on 2016/12/2.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "MatrixView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MatrixView *matrixView;

@property (weak, nonatomic) IBOutlet UIButton *moveBtnX;
@property (weak, nonatomic) IBOutlet UIButton *moveBtnY;

@end

@implementation ViewController

static bool xButtonIsDown;
static bool yButtonIsDown;

+ (BOOL)isPressDownX
{
    return xButtonIsDown;
}

+ (BOOL)isPressDownY
{
    return yButtonIsDown;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.moveBtnX.tag = 0;
    self.moveBtnY.tag = 1;
    
    [self.moveBtnX addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.moveBtnX addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self.moveBtnX addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchCancel];
    [self.moveBtnX addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
    
    [self.moveBtnY addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchUpInside];
    [self.moveBtnY addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchUpOutside];
    [self.moveBtnY addTarget:self action:@selector(onUp:) forControlEvents:UIControlEventTouchCancel];
    [self.moveBtnY addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];
    
    
    // 使用多執行緒實現按鈕按住
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        while (1)
        {
            // 按下X軸移動按鈕
            if([ViewController isPressDownX])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.matrixView moveX];
                });
                
            }
            // 按下Y軸移動按鈕
            else if([ViewController isPressDownY])
            {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [self.matrixView moveY];
                });
            }
        }
    });
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// 按鍵按下
- (void) onClick:(UIButton *)button
{
    if(button.tag == 0) xButtonIsDown = true;
    else yButtonIsDown = true;
}

// 按鍵抬起
- (void) onUp:(UIButton *)button
{
    if(button.tag == 0) xButtonIsDown = false;
    else yButtonIsDown = false;
}

@end
