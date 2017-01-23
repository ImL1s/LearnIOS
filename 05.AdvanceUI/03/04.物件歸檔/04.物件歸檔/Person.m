//
//  Person.m
//  04.物件歸檔
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "Person.h"

@implementation Person

// 在轉成二進制檔案時要將哪些屬性放進去
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInteger:self.age forKey:@"age"];
    [aCoder encodeObject:self.dog forKey:@"dog'"];
}

// 從二進制檔案中讀取哪些屬性到物件中
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
    {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntegerForKey:@"age"];
        self.dog = [aDecoder decodeObjectForKey:@"dog'"];
    }
    return self;
}

@end
