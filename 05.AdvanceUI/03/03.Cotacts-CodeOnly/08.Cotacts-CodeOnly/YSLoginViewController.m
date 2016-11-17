//
//  YSLoginViewController.m
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/15.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSLoginViewController.h"
#import "YSContactTableViewController.h"
#import "MBProgressHUD+XMG.h"



@interface YSLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UISwitch *rememberSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *autoLoginSwitch;
@property (strong,nonatomic) NSUserDefaults *userDefaults;

@end

@implementation YSLoginViewController

#pragma mark - get/set

- (NSUserDefaults *)userDefaults
{
    if(_userDefaults == nil)
    {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}

#pragma mark - UIViewController method

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"歡迎進入通訊錄";
    
    [self.accountField addTarget:self action:@selector(onTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.passwordField addTarget:self action:@selector(onTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.loginBtn addTarget:self action:@selector(onLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onBackToLoginView) name:YSMessage_onBackToLoginView object:nil];

    
//    self.accountField.text = @"YS";
//    self.passwordField.text = @"123";
    [self refreshUI];
    [self onTextFieldChange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

# pragma mark - othe method

// 重新整理UI狀態,看有沒有記住帳密、自動登錄..
- (void) refreshUI
{
    [self setSwitchStateFromUserDefaults];
    [self setFieldFromUserDefaults];
    
    if(self.autoLoginSwitch.on)
    {
        [self onLoginBtnClick];
    }
}

#pragma mark - UI event

// Field文字變更時調用
- (void)onTextFieldChange
{
    self.loginBtn.enabled = self.accountField.text.length && self.passwordField.text.length;
}

// 點擊登入按鈕
- (void)onLoginBtnClick
{
    [MBProgressHUD showMessage:@"請稍候" toView:self.view];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [MBProgressHUD hideHUDForView:self.view];
        
        if(![self.accountField.text isEqualToString:@"YS"] || ![self.passwordField.text isEqualToString:@"123"])
        {
            [MBProgressHUD showError:@"帳號密碼錯誤"];
            
            return;
        }
        
        [self saveSwitchStateToUserDefaults];
        [self saveAccountAndPwdToUserDefaults];
        
        YSContactTableViewController *contactVC = [[YSContactTableViewController alloc] init];
        contactVC.name = self.accountField.text;
        [self.navigationController pushViewController:contactVC animated:YES];
        
    });
    

}

#pragma mark - notifiacation

// 返回登入介面
- (void) onBackToLoginView
{
    [self refreshUI];
}


#pragma mark - save/read UserDefaults method

// 根據Userdefault的值,設定switch的狀態
- (void) setSwitchStateFromUserDefaults
{
    [self.rememberSwitch setOn:[self.userDefaults boolForKey:YSIsRemember]];
    [self.autoLoginSwitch setOn:[self.userDefaults boolForKey:YSIsAutoLogin]];
}

// 根據Userdefault的值,顯示到Field上
- (void) setFieldFromUserDefaults
{
    if(self.rememberSwitch.on)
    {
        self.accountField.text = [self.userDefaults stringForKey:YSAccount];
        self.passwordField.text = [self.userDefaults stringForKey:YSPassword];
    }
    else
    {
        self.accountField.text = @"";
        self.passwordField.text = @"";
    }
}

// 將帳號密碼儲存到UserDefaults
- (void) saveAccountAndPwdToUserDefaults
{
    if(self.rememberSwitch.on)
    {
        [self.userDefaults setObject:self.accountField.text forKey:YSAccount];
        [self.userDefaults setObject:self.passwordField.text forKey:YSPassword];
    }
    else
    {
        [self.userDefaults setObject:@"" forKey:YSAccount];
        [self.userDefaults setObject:@"" forKey:YSPassword];
    }
}

// 將Switch狀態儲存到UserDefaults
- (void) saveSwitchStateToUserDefaults
{
    [self.userDefaults setBool:self.rememberSwitch.on forKey:YSIsRemember];
    [self.userDefaults setBool:self.autoLoginSwitch.on forKey:YSIsAutoLogin];
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
