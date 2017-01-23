//
//  ViewController.m
//  04.物件歸檔
//
//  Created by ImL1s-MacPro on 2016/11/18.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)savePerson:(id)sender
{
    Person *p = [[Person alloc] init];
    Dog *d = [[Dog alloc] init];
    
    p.name = @"Sam";
    p.age = 24;
    p.dog = d;
    d.name = @"hot dog";
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"];
    
    NSLog(@"%@",filePath);
    NSLog(@"Write over");
    
    [NSKeyedArchiver archiveRootObject:p toFile:filePath];
}

-(IBAction)readPerson:(id)sender
{
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"person.data"];
    
    Person *p = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    
    NSLog(@"Name:%@  Age:%ld Dog:%@",p.name,p.age,p.dog.name);
}


@end
