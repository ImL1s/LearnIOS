//
//  FlagView.h
//  02.NationalFlag
//
//  Created by ImL1s-MacPro on 2016/10/22.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//
#import "UIKit/UIKit.h"
#import <Foundation/Foundation.h>

@class Flag;
@interface FlagView : UIView

@property(strong,nonatomic) Flag *flag;

@property(copy,nonatomic) NSString *str;

+(instancetype) flagView;

@end
