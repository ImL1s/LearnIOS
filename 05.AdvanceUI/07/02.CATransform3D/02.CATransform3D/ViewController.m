//
//  ViewController.m
//  02.CATransform3D
//
//  Created by ImL1s-MacPro on 2016/12/19.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, screenRect.size.height)];
    iv.image = [UIImage imageNamed:@"35957-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"];
    
    [self.view addSubview:iv];
}


- (void)didReceiveMemoryWarning
  {
    [super didReceiveMemoryWarning];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIImageView *iv =(UIImageView *) self.view.subviews[2];
    
    [UIView animateWithDuration:0.8 animations:^{
        
//        iv.layer.transform = CATransform3DMakeRotation(M_PI, 0, 1, 1);
        
        CATransform3D ct3d = CATransform3DMakeRotation(M_PI, 0, 1, 1);
        NSValue *nv = [NSValue valueWithCATransform3D:ct3d];
        
        [iv.layer setValue:nv forKey:@"transform"];
        
    } completion:^(BOOL finished) {
        
        
        [UIView animateWithDuration:1 animations:^{
           
            iv.layer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 0);
            
            // 使用setValue快速設定Rotation
            [iv.layer setValue:@(M_PI) forKey:@"transform.rotation"];
        }];
        
    }];
    
    
    
    
}

@end
