//
//  ViewController.m
//  01.transform
//
//  Created by ImL1s-MacPro on 2016/11/20.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *img;

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

-(IBAction)moveUp:(id)sender
{
    // 相對於最原始的Transform做形變
//    self.img.transform = CGAffineTransformMakeTranslation(0, -25);
    
    // 相對於當前的位置做形變
    self.img.transform = CGAffineTransformTranslate(self.img.transform, 0, -25);
    
//    [UIView animateWithDuration:0.5 animations:^{
    
//            self.img.transform = CGAffineTransformTranslate(self.img.transform, 0, -25);
//    }];
}


-(IBAction)rotate:(id)sender
{
//    self.img.transform = CGAffineTransformMakeRotation(M_PI_4);
    
    self.img.transform = CGAffineTransformRotate(self.img.transform, M_PI_4);
}

-(IBAction)scale:(id)sender
{
    self.img.transform = CGAffineTransformScale(self.img.transform, 1.2, 1.2);
}

@end
