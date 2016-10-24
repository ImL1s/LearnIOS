//
//  Flag.h
//  02.NationalFlag
//
//  Created by ImL1s-MacPro on 2016/10/23.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Flag : NSObject

@property(nonatomic,copy) NSString *name;

@property(nonatomic,copy) NSString *icon;

+ (id) flagWithDic:(NSDictionary*) dic;
+ (NSArray *) flagList;

@end
