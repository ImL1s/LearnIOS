//
//  ViewController.m
//  13.Modal
//
//  Created by ImL1s-MacPro on 2016/11/20.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "YSViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *pBtn;

@property (strong,nonatomic) YSViewController *modalController;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.pBtn addTarget:self action:@selector(onPBtnClick) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) onPBtnClick
{
    [self systemDefaultModal];
//    [self myModal];
}

// 系統的Modal
- (void) systemDefaultModal
{
    YSViewController *controller = [[YSViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
     NSLog(@"%@",self.presentedViewController);
    //    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:controller];
    //    [self presentViewController:navc animated:YES completion:nil];
}

// 自己實現Modal
- (void) myModal
{
    YSViewController *controller = [[YSViewController alloc] init];
    self.modalController = controller;
    
//    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:controller];
//    [self presentViewController:navc animated:YES completion:nil];
    
    CGRect rect = controller.view.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height;
    controller.view.frame = rect;
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.modalController.view];
    
    [UIView animateWithDuration:1 animations:^{
        
        self.modalController.view.frame = self.view.frame;
    } completion:^(BOOL finished){
        
        [self.view removeFromSuperview];
    }];
}


@end
