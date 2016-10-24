//
//  Flag.m
//  02.NationalFlag
//
//  Created by ImL1s-MacPro on 2016/10/23.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "Flag.h"

@implementation Flag

- (id) initWithDic:(NSDictionary *)dic
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (id) flagWithDic:(NSDictionary*) dic
{
    return [[self alloc] initWithDic:dic];
}


+ (NSArray *)flagList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"flags" ofType:@"plist"];
    NSArray *dicArray = [NSArray arrayWithContentsOfFile:path];
    
    NSMutableArray *mutableArray = [NSMutableArray array];
    
    for (NSDictionary *dic in dicArray )
    {
        Flag *flag = [self flagWithDic:dic];
        [mutableArray addObject:flag];
    }
    
    return mutableArray;
}

@end
