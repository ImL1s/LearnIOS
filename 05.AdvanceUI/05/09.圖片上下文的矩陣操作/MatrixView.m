//
//  MatrixView.m
//  09.圖片上下文的矩陣操作
//
//  Created by ImL1s-MacPro on 2016/12/2.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "MatrixView.h"

@implementation MatrixView

UIBezierPath *path;
CGFloat x = 0;
CGFloat y = 0;


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 50)];
    
    CGContextTranslateCTM(ctx, x, y);
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
}

// 移動X軸
- (void)moveX
{
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    x = (x > screenWidth ? 0 : x + 0.01);
    
    [self setNeedsDisplay];
}

// 移動Y軸
-(void)moveY
{
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    y = (y > screenHeight ? 0 : y + 0.01);
    
    [self setNeedsDisplay];
}

@end
