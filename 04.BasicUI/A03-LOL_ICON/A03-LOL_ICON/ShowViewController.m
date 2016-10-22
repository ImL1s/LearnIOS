//
//  ShowViewController.m
//  A03-LOL_ICON
//
//  Created by yushanglung on 2016/9/2.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@property (strong, nonatomic) IBOutlet UIButton *backBtn;
@property (strong, nonatomic) IBOutlet UIImageView *showImgView;
@property (strong, nonatomic) IBOutlet UILabel *txtLabel;


@end

@implementation ShowViewController

//- (void)setValue1:(NSString *)va{
//    _value1 =va;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[self backBtn] addTarget:self action:@selector(onClickBackBtn:) forControlEvents:UIControlEventTouchUpInside];

    _txtLabel.text = [self iconModel].name;
    _showImgView.image = [UIImage imageNamed:([self iconModel].icon)];
//    _txtLabel.text = [self name];
//    _showImgView.image = [UIImage imageNamed:_imgName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickBackBtn:(UIButton *)btn{
    [self dismissViewControllerAnimated:true completion:NULL];
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
