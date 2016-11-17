//
//  YSEditViewController.m
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/16.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSEditViewController.h"

@interface YSEditViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UIButton *updateBtn;

@end

@implementation YSEditViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"編輯" style:UIBarButtonItemStylePlain target:self action:@selector(onEditBarBtnClick)];
    self.nameField.text = self.model.name;
    self.phoneField.text = self.model.phone;
    [self.updateBtn addTarget:self action:@selector(onUpdateBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self setUILock:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



#pragma mark - UI control event

- (void) onUpdateBtnClick
{
    self.model.name = [self.nameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    self.model.phone = [self.phoneField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"onEditedContact" object:nil];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) onEditBarBtnClick
{
    if([self.navigationItem.rightBarButtonItem.title isEqualToString:@"編輯"])
    {
        [self setUILock:NO];
        self.navigationItem.rightBarButtonItem.title = @"取消";
    }
    else
    {
        [self setUILock:YES];
        self.navigationItem.rightBarButtonItem.title = @"編輯";
    }
}

#pragma  mark - other method

- (void) setUILock:(bool)isLock
{
    [self.nameField setEnabled:!isLock];
    [self.phoneField setEnabled:!isLock];
    [self.updateBtn setHidden:isLock];
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
