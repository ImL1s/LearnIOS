//
//  MyCarGroup.h
//  A02-汽車品盤
//
//  Created by yushanglung on 2016/8/30.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyCarGroup : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *intro;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)carGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)carGroupList;

@end
