//
//  Car.h
//  A04-汽車數據升級
//
//  Created by yushanglung on 2016/9/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property(nonatomic,copy) NSString *icon;
@property(nonatomic,copy) NSString *name;

- (instancetype)initWithDic:(NSDictionary *)dic;
    
+ (instancetype)carWithDic:(NSDictionary *)dic;

@end
