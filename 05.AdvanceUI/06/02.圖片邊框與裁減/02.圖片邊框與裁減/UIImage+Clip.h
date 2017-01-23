//
//  UIImage+Clip.h
//  02.圖片邊框與裁減
//
//  Created by ImL1s-MacPro on 2016/12/6.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(clipImage)

+ (UIImage *)imageWithBorder:(CGSize)border color:(UIColor *)borderColor image:(UIImage *)image;

@end
