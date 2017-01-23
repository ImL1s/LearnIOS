//
//  YSUIPictureView.m
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/14.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSUIPictureView.h"

@interface YSUIPictureView()<UIGestureRecognizerDelegate>

@property(nonatomic,strong)UIImageView *imageView;

@end

@implementation YSUIPictureView

#pragma mark - get/set method

- (UIImageView *)imageView
{
    if(_imageView == nil)
    {
        [self setBackgroundColor:[UIColor whiteColor]];
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        
        [self setGR];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image
{
    self.imageView.image = image;
    _image = image;
}

#pragma mark - UIViewController method

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
//    [self setBackgroundColor:[UIColor yellowColor]];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
}

#pragma mark - gestureRecognizer method

// 是否支持多點觸控
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


#pragma mark - other method

- (void)setGR
{
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [_imageView addGestureRecognizer:panGR];
    
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotation:)];
    [_imageView addGestureRecognizer:rotationGR];
    
    UIPinchGestureRecognizer *pGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinch:)];
    [_imageView addGestureRecognizer:pGR];
    
    UILongPressGestureRecognizer *longPGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongPress:)];
    
    [_imageView addGestureRecognizer:longPGR];
    
    rotationGR.delegate = self;
    pGR.delegate = self;
}



// 旋轉
- (void)onRotation:(UIRotationGestureRecognizer *)rotationGR
{
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotationGR.rotation);
    
    rotationGR.rotation = 0;
}

// 捏
- (void)onPinch:(UIPinchGestureRecognizer *)pinchGR
{
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinchGR.scale, pinchGR.scale);
    NSLog(@"%f",pinchGR.scale);
    
    pinchGR.scale = 1;
}

// 移動
- (void)onPan:(UIPanGestureRecognizer *)panGR
{
    CGPoint point = [panGR translationInView:panGR.view];
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, point.x, point.y);
    [panGR setTranslation:CGPointZero inView:panGR.view];
}

// 長壓
- (void)onLongPress:(UILongPressGestureRecognizer *)longPressGR
{
    if(longPressGR.state == UIGestureRecognizerStateBegan)
    {
        // 儲存時的一閃效果
        [UIView animateWithDuration:0.25 animations:^{
            
            self.imageView.alpha = 0;
            
        } completion:^(BOOL finished) {
            
            self.imageView.alpha = 1;
            
            // 截屏當前View
            UIGraphicsBeginImageContextWithOptions(self.frame.size, NO, 0);
            
            CGContextRef ref = UIGraphicsGetCurrentContext();
            
            [self.layer renderInContext:ref];
            
            UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            if([self.delegate respondsToSelector:@selector(pictureView:addNewImage:)])
            {
                [self.delegate pictureView:self addNewImage:resultImage];
            }
            
        }];
    }
}

@end
