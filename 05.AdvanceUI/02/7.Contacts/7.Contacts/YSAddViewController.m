//
//  YSAddViewController.m
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/14.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSAddViewController.h"
#import "ContactModel.h"
#import "YSContactsTableViewController.h"

@interface YSAddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *telField;
@property (weak, nonatomic) IBOutlet UIButton *addBtn;


@end

@implementation YSAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.addBtn addTarget:self action:@selector(onAddBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) onAddBtnClick
{
    ContactModel *model = [[ContactModel alloc] init];
    model.name = self.nameField.text;
    model.phone = self.telField.text;
//    self.contactsVC.contactModel = model;
    if([self.delegate respondsToSelector:@selector(addContactVC:contactModel:)])
    {
        [self.delegate addContactVC:self contactModel:model];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    NSLog(@"%@",segue.identifier);
//}

@end
