//
//  ViewController.m
//  10.手勢識別
//
//  Created by ImL1s-MacPro on 2016/11/23.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpLongTouch];
    [self setUpTap];
    [self setUpSwipe];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

// 滑動手勢
- (void) setUpSwipe
{
    UISwipeGestureRecognizer *recognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    
    recognizerUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    UISwipeGestureRecognizer *recognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipe:)];
    
    recognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self.image addGestureRecognizer:recognizerUp];
    [self.image addGestureRecognizer:recognizerLeft];
}

- (void) onSwipe:(UISwipeGestureRecognizer *)recognizer
{
    switch (recognizer.direction)
    {
        case UISwipeGestureRecognizerDirectionUp:
            NSLog(@"UISwipeGestureRecognizerDirectionUp");
            break;
            
        case UISwipeGestureRecognizerDirectionDown:
            NSLog(@"UISwipeGestureRecognizerDirectionDown");
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            NSLog(@"UISwipeGestureRecognizerDirectionLeft");
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            NSLog(@"UISwipeGestureRecognizerDirectionRight");
            break;
            
        default:
            break;
    }
}

// 點擊手勢
- (void) setUpTap
{
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    tapGR.delegate = self;
    [self.image addGestureRecognizer:tapGR];
}

- (void) onTap:(UIGestureRecognizer *) recognizer
{
    NSLog(@"onTap");
}


// 長點擊手勢
- (void) setUpLongTouch
{
    UILongPressGestureRecognizer *longPGR = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(onLongTouch:)];
    
    [self.image addGestureRecognizer:longPGR];
}


- (void) onLongTouch:(UILongPressGestureRecognizer *)recognizer
{
    if(recognizer.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"LongPressBegan");
    }
    else if(recognizer.state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"LongPressChanged");
    }
    else if(recognizer.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"LongPressEnded");
    }
}

#pragma mark - UIGestureRecognizer delegate

// 是否可以觸控
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch;
{
    CGPoint touchPoint = [touch locationInView:self.view];
    CGSize viewSize = self.view.frame.size;
    
    if(touchPoint.x > viewSize.width /2)
        return true;
    
    return false;
}

@end
