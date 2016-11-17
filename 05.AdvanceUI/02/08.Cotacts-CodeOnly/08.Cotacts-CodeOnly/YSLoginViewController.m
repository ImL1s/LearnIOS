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

@end

@implementation YSLoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"歡迎進入通訊錄";
    
    [self.accountField addTarget:self action:@selector(onTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.passwordField addTarget:self action:@selector(onTextFieldChange) forControlEvents:UIControlEventEditingChanged];
    
    [self.loginBtn addTarget:self action:@selector(onLoginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    self.accountField.text = @"YS";
    self.passwordField.text = @"123";
    
        [self onTextFieldChange];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)onTextFieldChange
{
    self.loginBtn.enabled = self.accountField.text.length && self.passwordField.text.length;
}

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

        YSContactTableViewController *contactVC = [[YSContactTableViewController alloc] init];
        contactVC.name = self.accountField.text;
        [self.navigationController pushViewController:contactVC animated:YES];
        
    });
    

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
