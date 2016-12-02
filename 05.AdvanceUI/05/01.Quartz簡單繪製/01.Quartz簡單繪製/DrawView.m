//
//  DrawView.m
//  01.Quartz簡單繪製
//
//  Created by ImL1s-MacPro on 2016/11/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [self drawCurve];
    [self drawStraightLine];
}

// 畫曲線
- (void) drawCurve
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(50, 300)];
    
    [path addQuadCurveToPoint:CGPointMake(300, 300) controlPoint:CGPointMake(175, 200)];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

// 畫直線
- (void) drawStraightLine
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 移動path到目標點
    [path moveToPoint:CGPointMake(50, 280)];
    
    // 從當前點到目標點畫線
    [path addLineToPoint:CGPointMake(250, 50)];
    
    // 從當前點到目標點畫線
    [path addLineToPoint:CGPointMake(250, 150)];
    
    
    [path moveToPoint:CGPointMake(80, 300)];
    
    // 設定線的寬度
    CGContextSetLineWidth(ctx, 20);
    
    // 設定連接點樣式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);    // 圓角
    //    CGContextSetLineJoin(ctx, kCGLineJoinBevel);    // 倒角
    //    CGContextSetLineJoin(ctx, kCGLineJoinMiter);    // 尖角(默認)
    
    // 設定端點樣式
    //    CGContextSetLineCap(ctx, kCGLineCapRound); // 繪製圓形端點
    //    CGContextSetLineCap(ctx, kCGLineCapButt);  // 不繪製端點,直接斷掉
    CGContextSetLineCap(ctx, kCGLineCapSquare);  // 繪製方形的端點,跟上面很像,只是比較長
    
    [[UIColor blueColor] set];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);

}

@end
