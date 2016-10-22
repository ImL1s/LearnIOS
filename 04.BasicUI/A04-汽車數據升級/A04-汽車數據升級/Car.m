//
//  Car.m
//  A04-汽車數據升級
//
//  Created by yushanglung on 2016/9/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "Car.h"

@implementation Car

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self = [super init]){
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)carWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
}

@end
