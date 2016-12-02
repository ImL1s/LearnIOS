//
//  MyImageView.h
//  06.模仿系統UIImageView
//
//  Created by ImL1s-MacPro on 2016/11/29.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyImageView : UIView

#pragma mark - ImageView縮放模式
#define ImageScaleModeDefault 0

#define ImageScaleModeFitWithHeight 1

#define ImageScaleModeFitWithWidth 2


#pragma mark - 屬性
@property(nonatomic,strong) UIImage *image;

@property(nonatomic,assign) NSInteger imageScaleMode;

- (instancetype)initWithImage:(UIImage *)image;


@end
