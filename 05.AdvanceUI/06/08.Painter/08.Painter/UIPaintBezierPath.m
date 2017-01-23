//
//  UIPaintBezierPath.m
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/14.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "UIPaintBezierPath.h"

@implementation UIPaintBezierPath

- (void)stroke
{
    [self.color set];
    [super stroke];
}

@end
