//
//  DrawView.m
//  02.Quartz(畫圖形)
//
//  Created by ImL1s-MacPro on 2016/11/25.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)awakeFromNib
{
    NSLog(@"awakeFromNib");
    [super awakeFromNib];
    self.frame = [[UIScreen mainScreen] bounds];
    self.backgroundColor = [UIColor blueColor];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"drawRect");
    
    // 在drawRect中不能使用self.backgroundColor
//    self.backgroundColor = [UIColor yellowColor];
//    [[UIColor grayColor] setFill];
//    UIRectFill(rect);
    
	
    [self drawArc:rect];
//    [self drawTwoGraph];
//    [self drawOval];
//    [self drawRect];  
//    [self drawLine];
}

// Center:弧所在的圆心
// radius:圆的半径
// startAngle:畫線開始的开始角度
// endAngle:截至角度
// clockwise: YES:顺时针 NO:逆时针
- (void) drawArc:(CGRect)rect
{
    NSLog(@"%@",NSStringFromCGRect(rect));
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 -10;
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:M_PI_2 clockwise:NO];
    
    [path addLineToPoint:center];
    [path closePath];
    // fill會自動ClosePath
//    [path fill];
    [path stroke];
}

// 畫兩個圖形
- (void) drawTwoGraph
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    [path moveToPoint:CGPointMake(50, 250)];
    [path addLineToPoint:CGPointMake(250, 250)];
    [path setLineWidth:10];
    [path stroke]; // 1.獲取上下文 -> 2.描述路徑 -> 3.把路徑家到上下文 -> 4.把上下文的內容渲染到View上
//    [path fill];
}

// 畫橢圓
- (void) drawOval
{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 80, 100)];
    [[UIColor redColor] set];
    [path stroke];
//    [path fill];
}

- (void) drawRect
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
  
    UIBezierPath *path;
    
    // 從(50,50)的點 向左100、向下100畫一個正方形
//    path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    
    // 圓角
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:50];
    
    [[UIColor yellowColor] set];
    
    CGContextAddPath(ctx, path.CGPath);
    // 描邊畫圖(空心)
//    CGContextStrokePath(ctx);
    
    // 填充畫圖(實心)
    CGContextFillPath(ctx);
}


// 畫出比較用的直線
- (void) drawLine
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 45)];
    [path addLineToPoint:CGPointMake(100, 45)];
    
    
    [[UIColor blueColor] set];
    CGContextAddPath(ctx, path.CGPath);
    
    CGContextStrokePath(ctx);
//    CGContextFillPath(ctx);
}


@end
