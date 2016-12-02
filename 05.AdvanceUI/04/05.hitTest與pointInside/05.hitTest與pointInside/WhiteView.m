//
//  WhiteView.m
//  05.hitTest與pointInside
//
//  Created by ImL1s-MacPro on 2016/11/21.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"HitTest: %@",NSStringFromClass([self class]));
    
    if(!self.userInteractionEnabled || self.hidden || self.alpha < 0.01 || ![self pointInside:point withEvent:event])
    {
        // 本UIView不能接收任何事件或是並沒有點擊到本View上,所以不去找尋其子UIView,直接返回nil
        return nil;
    }
    
    
    for (int i = (int)self.subviews.count -1; i >= 0; i--)
    {
        UIView *subView;
        
        if((subView = [self.subviews[i] hitTest:point withEvent:event]))
        {
            return subView;
        }
    }
    
    
    return  self;
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"PointInside: %@",NSStringFromClass([self class]));
    return YES;
}


@end
