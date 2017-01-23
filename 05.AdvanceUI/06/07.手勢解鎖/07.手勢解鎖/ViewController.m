//
//  ViewController.m
//  07.手勢解鎖
//
//  Created by ImL1s-MacPro on 2016/12/9.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "LockView.h"

@interface ViewController () <LockViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    iv.image = [UIImage imageNamed:@"Home_refresh_bg"];
    
    LockView *lockView = [[LockView alloc] init];
    lockView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height * 0.5);
    [lockView setUp];
    
    [self.view addSubview:iv];
    [self.view addSubview:lockView];
    lockView.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void)lockViewFirstSetPassword:(NSString *)numbersString
{
    [[NSUserDefaults standardUserDefaults] setObject:numbersString forKey:self.lockViewUserDefaultsPasswordKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
    NSLog(@"第一次輸入密碼");
    
    [self showMessage:@"圖形密碼設定成功"];
}

- (void)lockViewErrorPassword:(NSString *)errorPassword
{
    NSLog(@"LockViewErrorPassword");
    
    [self showMessage:@"圖形密碼錯誤"];
}

- (void)lockViewCorrectPassword:(NSString *)correctPassword
{
    NSLog(@"lockViewCorrectPassword");
    
    [self showMessage:@"圖形密碼正確"];
}

- (NSString *)lockViewUserDefaultsPasswordKey
{
    return @"graphicsPassword";
}

- (void)showMessage:(NSString *)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Message" message: message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertController addAction:action];
    
    [self presentViewController:alertController animated:YES completion:nil];

}





@end
