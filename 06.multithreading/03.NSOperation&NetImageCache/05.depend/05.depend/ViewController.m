//
//  ViewController.m
//  05.depend
//
//  Created by ImL1s-MacPro on 2016/11/3.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) NSOperationQueue *queue;

@end

@implementation ViewController

- (NSOperationQueue *)queue
{
    if(_queue == nil){
        _queue = [[NSOperationQueue alloc] init];
    }
    
    return _queue;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self dependecy];
}

- (void) dependecy
{
    NSBlockOperation *downloadOP = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"下載壓縮檔...");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"下載完成");
    }];
    
    NSBlockOperation *dataOP = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"解壓縮並刪除壓縮檔...");
        [NSThread sleepForTimeInterval:1];
        NSLog(@"刪除完成");
    }];
    
    NSBlockOperation *updateUIOP = [NSBlockOperation blockOperationWithBlock:^{
        
        NSLog(@"更新UI...");
    }];
    
    // 加入依賴可以等待依賴項目結束後再執行
    [dataOP addDependency:downloadOP];
    [updateUIOP addDependency:dataOP];
    
    [self.queue addOperations:@[dataOP,downloadOP] waitUntilFinished:YES];
    
    NSLog(@"Finished!");
    
    [[NSOperationQueue mainQueue] addOperation:updateUIOP];
    
    NSLog(@"updateUIOP Finished");
    
}


@end
