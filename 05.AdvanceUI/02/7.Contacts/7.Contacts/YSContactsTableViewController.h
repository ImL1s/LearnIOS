//
//  YSContactsTableViewController.h
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/12.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactModel.h"

@interface YSContactsTableViewController : UITableViewController

@property(nonatomic,copy) NSString *userName;
@property (nonatomic,strong) ContactModel *contactModel;

@end
