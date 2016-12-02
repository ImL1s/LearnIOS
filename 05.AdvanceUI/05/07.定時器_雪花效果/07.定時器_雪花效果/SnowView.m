//
//  SnowView.m
//  07.定時器_雪花效果
//
//  Created by ImL1s-MacPro on 2016/12/2.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "SnowView.h"

@implementation SnowView

static int _x = 50;
static int _y = 0;

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor blackColor];
    CADisplayLink *clink = [CADisplayLink displayLinkWithTarget:self selector:@selector(moveY)];
    [clink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}


- (void)moveY
{
    NSLog(@"%d", ((int)(arc4random() % 5)) - 2 );
//    int backupX = _x;
//    _x += ((int)(arc4random() % 5)) -2;
    _x += 6;
    _y+=5;
    
    _y = _y > [[UIScreen mainScreen] bounds].size.height? 0:_y;
    _x = _x > [[UIScreen mainScreen] bounds].size.width || _x < 0? 0:_x;
//    _x = _x > [[UIScreen mainScreen] bounds].size.width || _x < 0? backupX:_x;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect
{
    UIImage *image = [UIImage imageNamed:@"雪花"];
    
    [image drawAtPoint:CGPointMake(_x, _y)];
}


@end
