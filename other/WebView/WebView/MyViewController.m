//
//  MyViewController.m
//  WebView
//
//  Created by ImL1s-MacPro on 2016/10/27.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()<UIWebViewDelegate,UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicator;
@property (weak, nonatomic) IBOutlet UILabel *refreshLabel;
@property (assign,nonatomic) NSInteger originalY;
@property (assign,nonatomic) NSInteger animationSpeed;
@property (assign,nonatomic) BOOL canRefresh;

@end

@implementation MyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initWebView];
    
    self.animationSpeed = 10;
    self.canRefresh = YES;
    self.originalY = self.refreshLabel.frame.origin.y;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch Began");
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"--------- Touch Moved");
}

// 初始化WebView
- (void) initWebView
{
    CGRect webFrame = CGRectMake(0, 0, 320.0, 420.0);
    [self webView].frame = webFrame;
    
    [self webView].scalesPageToFit = YES;
    NSURL *url = [NSURL URLWithString:@"http://m.kcai188.com/"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[self webView]loadRequest:request];
    
    [self.webView.scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:NULL];

}

// scrollView的監聽方法
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if([keyPath isEqualToString:@"contentOffset"])
    {
        CGFloat y = self.webView.scrollView.contentOffset.y;
        
        if(y < -60 && !self.webView.isLoading && self.canRefresh)
        {
            [self.webView reload];
            [self startTimer];
        }
        
    }
}

- (void) startTimer
{
    self.canRefresh = NO;
    float interval = 5;
    
    [NSTimer scheduledTimerWithTimeInterval:interval repeats:NO block:^(NSTimer * _Nonnull timer) {
      
        self.canRefresh = YES;
    }];
}


- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.refreshLabel.hidden = false;
    [self animatedLabel];
    [self.indicator startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.refreshLabel.hidden = YES;
    [self.indicator stopAnimating];
}

- (void)animatedLabel
{
    NSLog(@"---------%f",[self refreshLabel].frame.origin.y);
    
    [UIView animateWithDuration:0.5
                     animations:^()
    {
        self.refreshLabel.hidden = NO;
        CGRect rect = self.refreshLabel.frame;
        rect.origin.y -= 15;
        
        self.refreshLabel.frame = rect;
        
    }
    completion: ^(BOOL finished)
    {
        if(!finished) NSLog(@"completion:NO");
        if(finished)
        {
            NSLog(@"completion:YES");
            [self replaceAndHiddenLabel];
        }
    }];
}

- (void) replaceAndHiddenLabel
{
    CGRect rect = self.refreshLabel.frame;
    rect.origin.y = self.originalY;
    self.refreshLabel.frame = rect;
    self.refreshLabel.hidden = YES;
}


@end
