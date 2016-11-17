//
//  TwoViewController.m
//  3.NavigationController_InCOde
//
//  Created by ImL1s-MacPro on 2016/11/10.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"

@interface TwoViewController ()

- (IBAction)onClickBackBtn;

- (IBAction)onClickThreeController:(id)sender;

@end

@implementation TwoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)dealloc
{
    NSLog(@"%s",__func__);
}

- (IBAction)onClickBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)onBackBtnClick {
}

- (IBAction)onClickThreeController:(id)sender
{
    ThreeViewController *threeViewController = [[ThreeViewController alloc] init];
    [self.navigationController pushViewController:threeViewController animated:YES];
}
@end
