//
//  ShowViewController.h
//  A03-LOL_ICON
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IconModel.h"

@interface ShowViewController : UIViewController

@property(nonatomic,strong) NSString *imgName;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) IconModel *iconModel;

@end
