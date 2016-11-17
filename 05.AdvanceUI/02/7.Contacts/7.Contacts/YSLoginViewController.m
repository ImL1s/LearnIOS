//
//  YSLoginViewController.m
//  7.Contacts
//
//  Created by ImL1s-MacPro on 2016/11/12.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSLoginViewController.h"
#import "MBProgressHUD+XMG.h"
#import "YSContactsTableViewController.h"

@interface YSLoginViewController () /** <UITextFieldDelegate> **/

@property (weak, nonatomic) IBOutlet UITextField *accField;

@property (weak, nonatomic) IBOutlet UITextField *pwdField;

@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation YSLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //    self.accField.delegate = self;
    //    self.pwdField.delegate = self;
    
    [self.accField addTarget:self action:@selector(onTextChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.pwdField addTarget:self action:@selector(onTextChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.rememberSwitch addTarget:self action:@selector(onSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.autoLoginSwitch addTarget:self action:@selector(onSwitchChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.loginBtn addTarget:self action:@selector(onLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self onTextChange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) onTextChange
{
    self.loginBtn.enabled = self.accField.text.length && self.pwdField.text.length;
}

// switch改變
- (void) onSwitchChanged:(UISwitch *)uSwitch
{
    switch (uSwitch.tag)
    {
        case 0:
            [self onRememberSwitchSwitched];
            break;
            
        case 1:
            [self onAutoLoginSwitchSwitched];
            break;
            
        default:
            break;
    }
}

- (void) onRememberSwitchSwitched
{
    NSLog(@"%s",__func__);
    
    if(!self.rememberSwitch.on)
//        self.autoLoginSwitch.on = NO;
        [self.autoLoginSwitch setOn:NO animated:YES];
    
}

- (void) onAutoLoginSwitchSwitched
{
    NSLog(@"%s",__func__);
    
    if(self.autoLoginSwitch.on)
    {
        [self.rememberSwitch setOn:YES animated:YES];
    }
}

- (void) onLoginBtnClick
{
    // 顯示菊花等待
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    
    // 模擬伺服器延遲
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
       
        // 驗證帳號密碼
        if([self.accField.text  isEqual: @"abc"] && [self.pwdField.text  isEqual: @"123"])
        {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [self performSegueWithIdentifier:@"contactsSegue" sender:self];
        }
        else
        {
            [MBProgressHUD showError:@"帳號密碼錯誤"];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    });
}

// shouldChangeCharactersInRange 無法達到兩個Field都有值才正確顯示loginBtn
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    NSLog(@"Length:%lu Location:%lu ReloaceStr:%@",(unsigned long)range.length,(unsigned long)range.location,string);
//    return YES;
//}

/**
 performSegueWithIdentifier底層實現
 1.到StoryBoard當中去查找有沒有給定標識的segue.
 2.根據指定的標識,創建一個UIStoryboardSegue對像之後, 把當前的控制器,給它源控制器屬性賦值(segue.sourceViewController).
 3.UIStoryboardSegue對像,再去創建它的目標控制器.給UIStoryboardSegue的目標控制器屬性(segue.destinationViewController)賦值
 4.調用當前控制器prepareForSegue:方法,告訴用戶,當前的線已經准備好了.
 5.[segue perform]
 [segue.sourceViewController.navigationController pushViewController:segue.destinationViewController animated:YES];
 */

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    YSLoginViewController *loginVC = segue.sourceViewController;
    YSContactsTableViewController *contactsVC = segue.destinationViewController;
    
    contactsVC.userName = self.accField.text;
}

@end
