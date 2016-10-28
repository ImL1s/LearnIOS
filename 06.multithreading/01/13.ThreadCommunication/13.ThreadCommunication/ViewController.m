//
//  ViewController.m
//  13.ThreadCommunication
//
//  Created by ImL1s-MacPro on 2016/10/28.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    [self performSelectorInBackground:@selector(downloadImage) withObject:nil];
//    [self downloadImage];

}

- (void) downloadImage
{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    
    NSURL *url = [NSURL URLWithString:@"https://myanimelist.cdn-dena.com/images/anime/9/77484l.jpg"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    // 不要把設定UI的操作放在主執行緒中
//    self.imageView.image = image;
    
    // 1.執行changeImage方法在主線程中
//    [self performSelectorOnMainThread:@selector(changeImageView:) withObject:image waitUntilDone:NO];
    
    // 2.執行changeImage方法在主線程中
    [self performSelector:@selector(changeImageView:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
    
    // 3.使用UI內的setImage方法,並且在主執行緒中執行
//    [[self imageView] performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
}

- (void) changeImageView:(UIImage *)image
{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    self.imageView.image = image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void) initImageView
{
    
}


@end
