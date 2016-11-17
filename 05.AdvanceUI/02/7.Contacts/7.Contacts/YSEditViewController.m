//
//  YSEditViewController.m
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/15.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSEditViewController.h"
#import "ContactModel.h"

@interface YSEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UIButton *editBtn;

@property (weak, nonatomic) IBOutlet UIButton *editSwitchBtn;

@end

@implementation YSEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.editSwitchBtn setTitle:@"編輯" forState:UIControlStateNormal];
    [self lockUI];
    self.nameField.text = self.model.name;
    self.phoneField.text = self.model.phone;
    
    [self.editBtn addTarget:self action:@selector(onEditBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.editSwitchBtn addTarget:self action:@selector(onEditSwitchBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 點擊切換修改模式按鈕
- (void)onEditSwitchBtnClick
{
    if([self.editSwitchBtn.titleLabel.text isEqualToString:@"編輯"])
    {
        [self unLockUI];
        [self.editSwitchBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    else if([self.editSwitchBtn.titleLabel.text isEqualToString:@"取消"])
    {
        [self lockUI];
        [self.editSwitchBtn setTitle:@"編輯" forState:UIControlStateNormal];
    }
}

// 點擊修改UI按鈕
- (void) onEditBtnClick
{
    self.model.name = self.nameField.text;
    self.model.phone = self.phoneField.text;
    
    if([self.delegate respondsToSelector:@selector(onEdited)])
    {
        [self.delegate onEdited];
    }
    
    [self lockUI];
}

// 鎖定UI,不能修改
- (void) lockUI
{
    [self.editBtn setHidden:YES];
    [self.nameField setEnabled:NO];
    [self.phoneField setEnabled:NO];
}

// 解鎖UI
- (void) unLockUI
{
    [self.editBtn setHidden:NO];
    [self.nameField setEnabled:YES];
    [self.phoneField setEnabled:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
