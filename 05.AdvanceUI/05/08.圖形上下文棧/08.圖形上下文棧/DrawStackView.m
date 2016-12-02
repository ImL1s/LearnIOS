//
//  DrawStackView.m
//  08.圖形上下文棧
//
//  Created by ImL1s-MacPro on 2016/12/2.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "DrawStackView.h"

@implementation DrawStackView



- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(20, 150)];
    [path addLineToPoint:CGPointMake(150, 150)];
    
    CGContextAddPath(ctx, path.CGPath);
    // 儲存圖形棧的狀態
    CGContextSaveGState(ctx);
    
    CGContextStrokePath(ctx);
    
    
    [path moveToPoint:CGPointMake(85, 50)];
    [path addLineToPoint:CGPointMake(85, 250)];
    
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
    
    // 如果不申請一個新的path,他會依照當前的GraphicsState設定,把之前的所有路徑都重繪一遍
    path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(200, 150)];
    [path addLineToPoint:CGPointMake(250, 150)];
    
    CGContextAddPath(ctx,path.CGPath);
    // 回復圖形棧到上一個狀態
    CGContextRestoreGState(ctx);
    CGContextStrokePath(ctx);
    

    
}


@end
