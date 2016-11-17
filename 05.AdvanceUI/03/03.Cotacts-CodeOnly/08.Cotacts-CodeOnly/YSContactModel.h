//
//  YSContactModal.h
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/16.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSContactModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *phone;

+(YSContactModel *) modelWithName:(NSString *)name phone:(NSString *)phone;


@end
