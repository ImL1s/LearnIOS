//
//  YSEditViewController.h
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/15.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"

@protocol YSEditViewControllerDelegate <NSObject>

- (void) onEdited;


@end

@interface YSEditViewController : UIViewController

@property (weak,nonatomic) ContactModel *model;

@property (weak,nonatomic) id<YSEditViewControllerDelegate> delegate;

@end
