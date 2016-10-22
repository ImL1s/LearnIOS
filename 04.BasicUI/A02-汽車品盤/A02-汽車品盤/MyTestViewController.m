//
//  MyTestViewController.m
//  A02-汽車品盤
//
//  Created by yushanglung on 2016/8/31.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "MyTestViewController.h"

@interface MyTestViewController ()

@property(assign,nonatomic) NSString *value1;

@end

@implementation MyTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog([self value1]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onClickBtn:(id)sender {
    [self dismissViewControllerAnimated:true completion:NULL];
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSLog(@"prepareForSegue");
//}

@end
