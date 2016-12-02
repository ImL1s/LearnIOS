//
//  MyImageView.m
//  06.模仿系統UIImageView
//
//  Created by ImL1s-MacPro on 2016/11/29.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView


- (instancetype)initWithImage:(UIImage *)image
{
    if(self = [super init])
    {
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        self.image = image;
    }
    
    return self;
}

// 更換圖片時需要重新繪製圖片(更新image功能)
- (void)setImage:(UIImage *)image
{
    _image = image;
    
    [self setNeedsDisplay];
}



- (void)drawRect:(CGRect)rect
{
    switch ((int)self.imageScaleMode)
    {
        // 默認模式,直接繪圖
        case 0:
            [self.image drawInRect:rect];
            break;
        // 高度模式,根據高度等比例縮放
        case 1:
            [self drawRectWithFitHeight:rect];
            break;
        // 寬度模式,根據寬度等比例縮放
        case 2:
            [self drawRectWithFitWidth:rect];
            break;
            
        default:
            break;
    }

}

// 依照寬度等比例縮放圖片
- (void)drawRectWithFitWidth:(CGRect)rect
{
    CGFloat rW = rect.size.width;
    
    CGFloat iH = self.image.size.height;
    CGFloat iW = self.image.size.width;
    
    // 取得imageView的寬度是image寬度的幾倍
    CGFloat multiple = rW / iW;
    
    [self.image drawInRect:CGRectMake(0, 0, iW * multiple, iH * multiple)];
}

// 依照高度等比例縮放圖片
- (void)drawRectWithFitHeight:(CGRect)rect
{
    CGFloat rH = rect.size.height;
    
    CGFloat iH = self.image.size.height;
    CGFloat iW = self.image.size.width;
    
    // 取得imageView的高度是image高度的幾倍
    CGFloat multiple = rH / iH;
    
    [self.image drawInRect:CGRectMake(0, 0, iW * multiple, iH * multiple)];
}


@end
