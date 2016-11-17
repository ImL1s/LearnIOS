//
//  ViewController.m
//  01.Plist存儲
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
    
    //第一個參數:搜索的目錄
    //第二個參數:搜索的範圍
    //第三個參數:是否展開路徑(在ios當中識別~)
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSLog(@"%@",path);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)read
{
    NSLog(@"Read ...");
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingString:@"myData.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];
    
    NSLog(@"Read data:");
    NSLog(@"%@", (NSString *)array[0]);
}

-(IBAction)write
{
    NSLog(@"Write ...");
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    path = [path stringByAppendingString:@"myData.plist"];
    NSArray *array = @[@"YS",@24];
    [array writeToFile:path atomically:YES];
    NSLog(@"Write completed");
}


@end
