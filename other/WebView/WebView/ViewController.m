//
//  ViewController.m
//  WebView
//
//  Created by ImL1s-MacPro on 2016/10/24.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "MyViewController.h"

@interface ViewController ()<UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.webView.delegate = self;
    
//    NSURL *url = [[NSURL alloc] initWithString:@"http://www.google.com"];
//    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
//    [self.webView loadRequest:request];
//    [self webView].backgroundColor = [UIColor redColor];
//    [[self webView] goForward];
    
    
//    NSLog(url);
    
    [[self btn]addTarget:NULL action:@selector(nextView) forControlEvents:UIControlEventTouchUpInside];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-------------TouchEnd--------------");
}

- (void) nextView
{
    UIViewController *controller = [[MyViewController alloc] init];
    [self presentViewController:controller animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
