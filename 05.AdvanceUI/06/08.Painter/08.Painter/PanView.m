//
//  PanView.m
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/13.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "PanView.h"
#import "UIPaintBezierPath.h"

@interface PanView()

@property(nonatomic,strong)UIPaintBezierPath *path;         // 當前繪製的路徑

@property(nonatomic,strong)UIPaintBezierPath *erasePath;    // 橡皮擦路徑

@property(nonatomic,strong)NSMutableArray *pathArray;       // 所有繪製的路徑

@end


@implementation PanView

#pragma mark - get/set method

- (UIBezierPath *)path
{
    if(_path == nil)
    {
        _path = [UIPaintBezierPath bezierPath];
    }
    return _path;
}

- (UIPaintBezierPath *)erasePath
{
    if(_erasePath == nil)
    {
        _erasePath = [UIPaintBezierPath bezierPath];
    }
    return _erasePath;
}

- (NSMutableArray *)pathArray
{
    if(_pathArray == nil)
    {
        _pathArray = [NSMutableArray array];
    }
    return _pathArray;
}

- (void)setPathColor:(UIColor *)pathColor
{
//    self.path.color = pathColor;
    _pathColor = pathColor;
}

- (void)setPictureImage:(UIImage *)pictureImage
{
    _pictureImage = pictureImage;
//    [self addPictureImage:pictureImage];
}

#pragma mark - UIView method

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPan:)];
    [self addGestureRecognizer:panGR];
    self.pathColor = [UIColor blackColor];
}

- (void)drawRect:(CGRect)rect
{
    // 將路徑與圖片全部畫出來
    for (int i = 0; i < self.pathArray.count; i++)
    {
        id object = self.pathArray[i];
        
        if([object isKindOfClass:[UIPaintBezierPath class]])
        {
            UIPaintBezierPath *path = object;
            // 顏色設置已經寫到 UIPaintBezierPath 裡面了
            //        [path.color set];
            [path stroke];
        }
        else if([object isKindOfClass:[UIImage class]])
        {
            UIImage *image = object;
            [image drawInRect:rect];
        }
    }
    
    [[UIColor blackColor] set];
    [self.erasePath stroke];
    [self.erasePath removeAllPoints];
}


#pragma mark - PanView method

// 畫線
- (void)onPan:(UIPanGestureRecognizer *)panGR
{
    CGPoint point = [panGR locationInView:self];
    
    // 當手指開始畫時（起點）
    if(panGR.state == UIGestureRecognizerStateBegan)
    {
        [self startPath:point];
        
        if(self.state == PanViewStateErase)
            [self drawEraseCircle:point];
    }
    // 當手指移動時
    else if(panGR.state == UIGestureRecognizerStateChanged)
    {
        [self.path addLineToPoint:point];
        
        if(self.state == PanViewStateErase)
            [self drawEraseCircle:point];
        
//        [self setNeedsDisplay];
    }

        [self setNeedsDisplay];
    
}

// 開始畫線
- (void) startPath:(CGPoint)beginPoint
{
    self.path = [UIPaintBezierPath bezierPath];
    self.path.color = self.pathColor;
    self.path.lineWidth = self.pathWidth;
    [self.pathArray addObject:self.path];
    [self.path moveToPoint:CGPointMake(beginPoint.x, beginPoint.y)];
    [self.path setLineJoinStyle:kCGLineJoinRound];
    [self.path setLineCapStyle:kCGLineCapRound];
}

// 畫出橡皮擦提示範圍的圈圈
- (void) drawEraseCircle:(CGPoint)point
{
    [self.erasePath addArcWithCenter:point radius:self.pathWidth * 0.5 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    
    [self setNeedsDisplay];
}


// 清除所有畫線路徑
-(void) cleanAllPath
{
    [self.pathArray removeAllObjects];
    [self setNeedsDisplay];
}

// 上一步
-(void) backOneStep
{
    [self.pathArray removeLastObject];
    [self setNeedsDisplay];
}

// 將選擇相片加入到
-(void) addPictureImage:(UIImage *)pictureImage
{
    self.pictureImage = pictureImage;
    [self.pathArray addObject:pictureImage];
    [self setNeedsDisplay];
}

@end
