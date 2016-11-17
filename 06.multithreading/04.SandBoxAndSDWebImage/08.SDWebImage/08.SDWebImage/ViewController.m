//
//  ViewController.m
//  08.SDWebImage
//
//  Created by ImL1s-MacPro on 2016/11/7.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"NSHomeDirectory: %@",NSHomeDirectory());
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    // 使用SDWebImage做圖片異步下載
    NSURL *url = [NSURL URLWithString:@"https://pbs.twimg.com/media/Cowy6GNXEAAdJjs.jpg:large"];
    
        [self.imageView sd_setImageWithURL:url placeholderImage:nil options:SDWebImageProgressiveDownload progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {
        
            NSLog(@"當前下載:%d  期望下載:%d ",(int)receivedSize,(int)expectedSize);
            
        } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            
            NSLog(@"下載完成");
        }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}


@end
