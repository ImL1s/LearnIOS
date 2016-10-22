//
//  MyCarGroup.m
//  A02-汽車品盤
//
//  Created by yushanglung on 2016/8/30.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "MyCarGroup.h"

@implementation MyCarGroup


- (instancetype)initWithDic:(NSDictionary *)dic
{
    // 先調用父類的構造函數,等父類初始化成功,才開始自身的初始化作業
    if(self = [super init])
    {
        // 按照dic裡面的key來設定本類型的屬性值
        [self setValuesForKeysWithDictionary:dic];
//        NSLog(_desc);
    }
    
    return self;
}

+ (instancetype)carGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}


+ (NSArray *)carGroupList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"cars_simple" ofType:@"plist"];
    NSArray *res = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSDictionary *dic in res) {
        MyCarGroup *temp = [MyCarGroup carGroupWithDic:dic];
        [mutableArray addObject:temp];
    }
    
    return mutableArray;
}

@end
