//
//  AppBean.m
//  07.SyncDownloadImage
//
//  Created by ImL1s-MacPro on 2016/11/3.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "AppBean.h"

@implementation AppBean

+ (instancetype) appBeanWithDic:(NSDictionary *) dicData
{
    AppBean *bean = [[AppBean alloc]init];
    [bean setValuesForKeysWithDictionary:dicData];
    
    return bean;
}


@end
