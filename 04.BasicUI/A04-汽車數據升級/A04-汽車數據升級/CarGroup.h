//
//  CarGroup.h
//  A04-汽車數據升級
//
//  Created by yushanglung on 2016/9/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarGroup : NSObject

@property(nonatomic,strong) NSArray *cars;
@property(nonatomic,copy) NSString *title;

- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)carGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)array;

@end
