//
//  Dog.m
//  04.物件歸檔
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if(self = [super init])
        self.name = [aDecoder decodeObjectForKey:@"dName"];
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.name forKey:@"dName"];
}


@end
