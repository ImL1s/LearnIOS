//
//  UIKitView.m
//  05.UIKit繪圖演練
//
//  Created by ImL1s-MacPro on 2016/11/29.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "UIKitView.h"

@implementation UIKitView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor grayColor];
}

- (void)drawRect:(CGRect)rect
{
    [self drawImagePattern:rect];
//    [self drawImage:rect];
//    [self drawText:rect];
}


-(void)drawImagePattern:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"back_icon_S"];
    
    // 在指定的區域重複貼圖
    [image drawAsPatternInRect:self.bounds];
}


-(void)drawImage:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"35966-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone-2"];
    
    // 從指定點開始繪製圖片的原始大小
//    [image drawAtPoint:CG PointMake(0, 0)];
    
//    // 將圖片填充到指定的Rect中
//    [image drawInRect:rect];
    
    // 剪裁超過指定Rect的地方
    UIRectClip(CGRectMake(rect.size.width*0.5, 0, rect.size.width*0.4, rect.size.height));
    
    // 將圖片填充到指定的Rect中
    [image drawInRect:rect];
    
    
    
    // 快速畫方形
//    UIRectFill(CGRectMake(50, 50, 50, 50));
    
}


- (void)drawText:(CGRect)rect
{
    NSString *str = @"這是一串神秘的文字這是一串神秘的文字";
    
    NSMutableDictionary *mdic = [NSMutableDictionary dictionary];
    mdic[NSFontAttributeName] = [UIFont systemFontOfSize:30];
    mdic[NSForegroundColorAttributeName] = [UIColor redColor];
    mdic[NSStrokeColorAttributeName] = [UIColor blueColor];
    mdic[NSStrokeWidthAttributeName] = @1;
    
    // 設置陰影
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor yellowColor];
    shadow.shadowOffset = CGSizeMake(10 ,10);
    shadow.shadowBlurRadius = 2;
    mdic[NSShadowAttributeName] = shadow;
    
    // 將字畫在指定的點上
//    [str drawAtPoint:CGPointZero withAttributes:mdic];
    
    // 將字畫在指定的rect
    [str drawInRect:rect withAttributes:mdic];
}


@end
