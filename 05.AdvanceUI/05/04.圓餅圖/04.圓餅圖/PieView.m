//
//  PieView.m
//  04.圓餅圖
//
//  Created by ImL1s-MacPro on 2016/11/28.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "PieView.h"

#define defaultDegree 0

@implementation PieView


- (void)drawRect:(CGRect)rect
{
    CGFloat endDegree = [self drawPie:60 contextRect:rect startDegree:defaultDegree fillColor:[UIColor greenColor]];
    endDegree = [self drawPie:30 contextRect:rect startDegree:endDegree fillColor:[UIColor blueColor]];
    endDegree = [self drawPie:10 contextRect:rect startDegree:endDegree fillColor:[UIColor yellowColor]];
}


#define MaxPercent 100.0
- (CGFloat) drawPie:(CGFloat)percent contextRect:(CGRect)rect startDegree:(float)startDegree fillColor:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    CGFloat rWidth = rect.size.width;                                       // View寬度
    CGFloat rHeight = rect.size.height;                                     // View高度
    CGFloat shortSide = rWidth > rHeight? rHeight : rWidth;                 // 畫圓用的目標長度
    CGPoint center = CGPointMake(shortSide * 0.5, shortSide * 0.5);         // 圓的點
    CGFloat radius = shortSide * 0.5 - 10;                                  // 圓的半徑
    CGFloat startRadian = startDegree * (M_PI / 180);                       // 開始的位置(弧度,3點鐘為0,順時鐘為正)
    CGFloat offsetAngle = percent / MaxPercent * M_PI * 2;                  // 要畫弧的度數
    CGFloat endRadian = startRadian + offsetAngle;                          // 結束的位置(弧度)
    
    // 畫弧
    [path addArcWithCenter:center radius:radius startAngle:startRadian endAngle:endRadian clockwise:YES];
    
    // 畫一條從弧的結束點到目標點的直線
    [path addLineToPoint:center];
    
    [color set];
    
    // 使用填充的方式畫弧
    [path fill];
    
    // 將弧度轉成角度
    return endRadian * (180 / M_PI);
}


@end
