//
//  YSUIImageEX.m
//  10.Runtime-交換方法
//
//  Created by ImL1s-MacPro on 2016/11/17.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSUIImageEX.h"
#import <objc/message.h>

@implementation UIImage (YSUIImageEX)

+(void)load
{
    // 取得方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method imageNamedWithDebugMethod = class_getClassMethod(self, @selector(imageNamedWithDebug:));
    
    // 交換方法的實現
    method_exchangeImplementations(imageNamedMethod, imageNamedWithDebugMethod);
}

+ (UIImage *)imageNamedWithDebug:(NSString *)name
{
    UIImage *image = [self imageNamedWithDebug:name];
    
    if(image == nil)
    {
        NSLog(@"加載失敗");
    }
    else
    {
        NSLog(@"加載成功");
    }
    
    return image;
}

@end
