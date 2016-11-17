//
//  ViewController.m
//  07.Runtime消息機制
//
//  Created by ImL1s-MacPro on 2016/11/17.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self msg];
    [self test];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
    開發中使用Runtime的情況:
    1.裝B.
    2.調用私有方法.
 
 */

- (void) msg
{
    id obj = objc_msgSend([Person class], @selector(alloc));
    Person *p = objc_msgSend(obj, @selector(init));
    objc_msgSend(p, @selector(eat));
    objc_msgSend(p, sel_registerName("sleep"));
    objc_msgSend(p, sel_registerName("sleep:"),5);
}

- (void) test
{
    Person *p1 = objc_msgSend([Person class], @selector(alloc));
    p1 = objc_msgSend(p1, @selector(init));
    
    Person *p2 = objc_msgSend([Person class], @selector(alloc));
    p2 = objc_msgSend(p2, @selector(init));
}

@end
