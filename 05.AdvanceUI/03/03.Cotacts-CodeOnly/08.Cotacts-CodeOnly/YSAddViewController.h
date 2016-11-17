//
//  YSAddViewController.h
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/16.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSContactModel.h"

@class YSAddViewController;
@protocol YSAddViewControllerDelegate <NSObject>

@required

- (void) addViewController:(YSAddViewController *)controller onAddContactModel:(YSContactModel *)model;

@end

@interface YSAddViewController : UIViewController

@property(nonatomic,weak) id<YSAddViewControllerDelegate> delegate;

@end


