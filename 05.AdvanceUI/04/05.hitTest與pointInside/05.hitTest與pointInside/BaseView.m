//
//  BaseView.m
//  05.hitTest與pointInside
//
//  Created by ImL1s-MacPro on 2016/11/21.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"HitTest: %@",NSStringFromClass([self class]));
    
    return [super hitTest:point withEvent:event];
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    NSLog(@"PointInside : %@",NSStringFromClass([self class]));
    return [super pointInside:point withEvent:event];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
