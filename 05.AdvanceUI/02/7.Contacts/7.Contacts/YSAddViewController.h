//
//  YSAddViewController.h
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/14.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSContactsTableViewController.h"

@class YSAddViewController;
@protocol YSAddViewControllerDelegate <NSObject>

@optional
- (void) addContactVC:(YSAddViewController *)addViewController contactModel:(ContactModel *)contactModel;


@end


@interface YSAddViewController : UIViewController

@property (strong,nonatomic) YSContactsTableViewController *contactsVC;

@property (weak,nonatomic) id<YSAddViewControllerDelegate> delegate;

@end



