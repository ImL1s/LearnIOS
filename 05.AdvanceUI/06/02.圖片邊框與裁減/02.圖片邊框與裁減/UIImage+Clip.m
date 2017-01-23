//
//  UIImage+Clip.m
//  02.圖片邊框與裁減
//
//  Created by ImL1s-MacPro on 2016/12/6.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "UIImage+Clip.h"



@implementation UIImage(clipImage)

+ (UIImage *)imageWithBorder:(CGSize)border color:(UIColor *)borderColor image:(UIImage *)image
{
    // 先建立一個比傳入的UIImage長寬多border大小的上下文
    CGSize contextSize = CGSizeMake(image.size.width + border.width *2, image.size.height + border.height *2);
    UIGraphicsBeginImageContextWithOptions(contextSize, NO, 0);
    
    // 畫出圖片的邊框
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, contextSize.width, contextSize.height)];
    
    [borderColor set];
    [path fill];
    
    // 畫出裁剪區
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border.width, border.height, image.size.width, image.size.height)];
    
    [path addClip];
    
    [image drawAtPoint:CGPointZero];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    
    return result;
}

@end
