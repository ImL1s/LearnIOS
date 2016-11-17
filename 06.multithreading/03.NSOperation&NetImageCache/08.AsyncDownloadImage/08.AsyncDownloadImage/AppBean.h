//
//  AppBean.h
//  07.SyncDownloadImage
//
//  Created by ImL1s-MacPro on 2016/11/3.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface AppBean : NSObject

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *icon;

@property(nonatomic,strong) NSString *download;

@property(nonatomic,strong) UIImage *imageCache;

+ (instancetype) appBeanWithDic:(NSDictionary *) dicData;

@end
