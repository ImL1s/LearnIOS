//
//  IconModel.m
//  A03-LOL_ICON
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "IconModel.h"

@implementation IconModel

- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if(self = [super init]){
        [self setValuesForKeysWithDictionary:dic];
    }
    
    return self;
}

+ (instancetype)heroGroupWithDic:(NSDictionary *)dic{
    
    return [[self alloc] initWithDic:dic];
}

+ (NSArray *)heroGroupList;{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"heros" ofType:@"plist"];
    NSArray *res = [NSArray arrayWithContentsOfFile:path];
    NSMutableArray *list = [NSMutableArray array];
    
    for (NSDictionary *dic in res) {
        
        IconModel *model = [IconModel heroGroupWithDic:dic];
        [list addObject:model];
    }
    
    return list;
}

@end
