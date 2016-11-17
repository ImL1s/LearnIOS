//
//  ViewController.m
//  02.NSUserDefaults
//
//  Created by ImL1s-MacPro on 2016/11/17.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // NSUserDefaults 底層也是使用plist儲存
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"YS" forKey:@"name"];
    [defaults setObject:@10 forKey:@"age"];
    
    // 馬上寫入到持久化儲存中
    [defaults synchronize];
    
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES));
    NSLog(@"%@",NSHomeDirectory());
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 狄取UserDefaults
- (IBAction) readUserDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *name = [defaults objectForKey:@"name"];
    NSInteger age = [defaults integerForKey:@"age"];
    
    NSLog(@"%@ %ld",name,age);
}

@end
