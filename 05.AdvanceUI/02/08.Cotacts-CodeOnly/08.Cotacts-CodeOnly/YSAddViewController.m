//
//  YSAddViewController.m
//  08.Cotacts-CodeOnly
//
//  Created by ImL1s-MacPro on 2016/11/16.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "YSAddViewController.h"
#import "YSContactModel.h"

@interface YSAddViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;

@property (weak, nonatomic) IBOutlet UITextField *passwordFIeld;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@end


@implementation YSAddViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.addBtn addTarget:self action:@selector(onAddBtnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

- (void) onAddBtnClick
{
    if([self.delegate respondsToSelector:@selector(addViewController:onAddContactModel:)])
    {
        NSString *name = [self.accountField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        NSString *phone = [self.passwordFIeld.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        YSContactModel *model = [YSContactModel modelWithName:name phone:phone];
        
        [self.delegate addViewController:self onAddContactModel:model];
        [self.navigationController popViewControllerAnimated:YES];
    }
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
