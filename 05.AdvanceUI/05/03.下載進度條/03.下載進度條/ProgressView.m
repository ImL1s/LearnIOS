//
//  ProgressView.m
//  03.下載進度條
//
//  Created by ImL1s-MacPro on 2016/11/25.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    [self setNeedsDisplay];
}

#define maxProgress 100


- (void)drawRect:(CGRect)rect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height*0.5);
    CGFloat radius = rect.size.width > rect.size.height? rect.size.height * 0.5 -10 : rect.size.width * 0.5 - 10;
    CGFloat startA = -M_PI_2;
    // 取得當前滑動長度相對的弧度
    CGFloat angle = self.progress /maxProgress * M_PI * 2;
    // 將起始弧度加上滑動的弧度,得到結束位置(弧度)
    CGFloat endA = startA + angle;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startA endAngle:endA clockwise:YES];
    
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}

@end
