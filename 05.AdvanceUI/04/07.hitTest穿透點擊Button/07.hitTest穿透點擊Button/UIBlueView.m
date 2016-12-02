//
//  UIBlueView.m
//  07.hitTest穿透點擊Button
//
//  Created by ImL1s-MacPro on 2016/11/21.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "UIBlueView.h"

@interface UIBlueView()

@property(nonatomic,weak) IBOutlet UIButton *btn;

@end

@implementation UIBlueView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
//    CGPoint bluePoint = point;
//    CGPoint btnPoint1 = [self convertPoint:point toView:self.btn];
//    NSLog(@"(%f %f) (%f %f)",bluePoint.x,bluePoint.y,btnPoint1.x,btnPoint1.y);
    
    // 將座標係轉成Btn的座標係
    CGPoint btnPoint = [self convertPoint:point toView:self.btn];
    
    // 是否有點擊到btn
    if([self.btn hitTest:btnPoint withEvent:event])
    {
        return self.btn;
    }
    // 沒有點擊到btn,在檢查是否有點擊到blueView
    else
    {
        return [super hitTest:point withEvent:event];
    }
    
}

// 當判斷點擊到View時會調用此方法
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
