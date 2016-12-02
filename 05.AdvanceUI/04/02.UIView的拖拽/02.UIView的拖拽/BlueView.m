//
//  BlueView.m
//  02.UIView的拖拽
//
//  Created by ImL1s-MacPro on 2016/11/20.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"toychedBegan");
}


// 位移操作
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint previousPoint = [touch previousLocationInView:self];
    
    CGFloat offsetX = currentPoint.x - previousPoint.x;
    CGFloat offsetY = currentPoint.y - previousPoint.y;
    
//    self.transform = CGAffineTransformTranslate(self.transform, offsetX, offsetY);
    self.transform = CGAffineTransformMakeTranslation(self.transform.tx + offsetX, self.transform.ty + offsetY);
    
    NSLog(@"toychedMoved");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"toychedEnded");
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesCancelled");
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
