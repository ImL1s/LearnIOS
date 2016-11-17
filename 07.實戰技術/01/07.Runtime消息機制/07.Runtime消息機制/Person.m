//
//  Person.m
//  07.Runtime消息機制
//
//  Created by ImL1s-MacPro on 2016/11/17.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void) run
{
    NSLog(@"Run");
}
- (void) eat
{
    NSLog(@"Eat");
}

- (void) sleep
{
    NSLog(@"sleep");
}

- (void) sleep:(int)hour
{
    NSLog(@"Sleep:hour sleep %d",hour);
}

@end
