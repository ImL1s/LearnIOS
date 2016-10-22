//
//  IconModel.h
//  A03-LOL_ICON
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IconModel : NSObject

@property (nonatomic,copy) NSArray *icon;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *name;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)heroGroupWithDic:(NSDictionary *)dic;

+ (NSArray *)heroGroupList;

@end
