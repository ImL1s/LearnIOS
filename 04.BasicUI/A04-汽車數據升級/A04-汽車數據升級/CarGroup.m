//
//  CarGroup.m
//  A04-汽車數據升級
//
//  Created by yushanglung on 2016/9/7.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "CarGroup.h"
#import "Car.h"

@implementation CarGroup

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self = [super init]){
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)carGroupWithDic:(NSDictionary *)dic{
 
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)array{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_total" ofType:@"plist"];
    NSArray *arr = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic1 in arr) {
        
        CarGroup *group = [self carGroupWithDic:dic1];
        
        // 將原本Cars字典轉成Cars模型
        NSMutableArray *carMArray = [NSMutableArray array];
        for (NSDictionary *dic2 in group.cars) {
            
            Car *c = [Car carWithDic:dic2];
            [carMArray addObject:c];
        }
        
        group.cars = carMArray;
        
        [mutableArray addObject:group];
    }
    
    return mutableArray;
}

@end
