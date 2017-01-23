//
//  Person.h
//  04.物件歸檔
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject<NSCoding>

@property(strong,nonatomic) NSString *name;

@property(assign,nonatomic) NSInteger age;

@property(strong,nonatomic) Dog *dog;

@end
