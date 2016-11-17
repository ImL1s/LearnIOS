//
//  YSContactModal.m
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/16.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSContactModel.h"

@implementation YSContactModel

+(YSContactModel *) modelWithName:(NSString *)name phone:(NSString *)phone
{
     YSContactModel *model = [[YSContactModel alloc] init];
    
    model.name = name;
    model.phone = phone;
    
    return model;
}

@end
