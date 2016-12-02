//
//  ViewController.m
//  03.下載進度條
//
//  Created by ImL1s-MacPro on 2016/11/25.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *silder;
@property (weak, nonatomic) IBOutlet UILabel *percentTitle;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.silder.maximumValue = 100;
    [self.silder addTarget:self action:@selector(onValueChanged) forControlEvents:UIControlEventValueChanged];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


- (void)onValueChanged
{
    self.percentTitle.text = [NSString stringWithFormat:@" %.2f %%",self.silder.value];
    self.progressView.progress = self.silder.value;
}

@end
