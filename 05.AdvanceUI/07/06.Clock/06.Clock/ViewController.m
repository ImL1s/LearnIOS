//
//  ViewController.m
//  06.Clock
//
//  Created by ImL1s-MacPro on 2016/12/22.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

#define perSecAngle 360/60
#define perMinAngle 360/60
#define perHourAngle 360/12

#define angle2Rad(angle) (angle / 180.0 * M_PI)

@interface ViewController ()

typedef enum _EClockType
{
    EClockSec,
    EClockMin,
    EClockHour
    
}EClockType;

@property(strong,nonatomic) UIView *clockView;

@property(strong,nonatomic) CALayer *clockLayer;

@property(strong,nonatomic) CALayer *secLayer;

@property(strong,nonatomic) CALayer *minLayer;

@property(strong,nonatomic) CALayer *hourLayer;

@end

@implementation ViewController

- (UIView *)clockView
{
    if(_clockView == nil)
    {
        _clockView = [[UIView alloc] init];
        _clockView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _clockView.backgroundColor = [UIColor colorWithRed:0.5 green:0 blue:0 alpha:0.2];
    }
    
    return _clockView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    CGPoint windowCenter = self.view.center;

    layer.frame = CGRectMake(windowCenter.x, windowCenter.y, 150, 150);
    layer.contents = (__bridge id _Nullable)([UIImage imageNamed:@"clock"].CGImage);
    layer.position = CGPointMake(windowCenter.x, windowCenter.y *0.4);
    [self.clockView.layer addSublayer:layer];
    self.clockLayer = layer;
    
    [self.view addSubview:self.clockView];
    
    [self setSec];
    [self setMin];
    [self setHour];
    
    [self moveSec];
    [self moveMin];
    [self moveHour];
    
    [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer)
    {
        [self moveSec];
        [self moveMin];
        [self moveHour];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 選擇旋轉方向:
    // 1. 以旋轉距離最小的方向優先
    // 2. 若兩個距離一樣,逆時鐘優先
//    self.secLayer.transform = CATransform3DMakeRotation(M_PI, 0, 0, 1);
}


- (NSDateComponents *)getCurrentDateComponents
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    
    return dateComponents;
}


- (void)setSec
{
    CALayer *layer = [self drawHandWithHeight:self.clockLayer.bounds.size.height * 0.4 color:[UIColor blackColor].CGColor];
    self.secLayer = layer;
    
    [self.clockView.layer addSublayer:layer];
}


- (void)setMin
{
    CALayer *layer = [self drawHandWithHeight:self.clockLayer.bounds.size.height * 0.3 color:[UIColor blueColor].CGColor];
    self.minLayer = layer;
    
    [self.clockView.layer addSublayer:layer];
}


- (void)setHour
{
    CALayer *layer = [self drawHandWithHeight:self.clockLayer.bounds.size.height * 0.2 color:[UIColor redColor].CGColor];
    self.hourLayer = layer;
    
    [self.clockView.layer addSublayer:layer];
}


- (CALayer *)drawHandWithHeight:(CGFloat)height color:(CGColorRef)color
{
    CALayer *layer = [CALayer layer];
    
    layer.bounds = CGRectMake(0, 0, 2, height);
    layer.backgroundColor = color;
    layer.anchorPoint = CGPointMake(0.5, 1);
//    layer.position = CGPointMake(self.clockView.center.x, self.clockView.center.y);
    layer.position = CGPointMake(self.clockLayer.position.x, self.clockLayer.position.y);
    layer.cornerRadius = 1.5;
    
    [self.clockView.layer addSublayer:layer];
    
    return layer;
}


- (void)moveSec
{
    [self moveHandWithLayer:self.secLayer clockType:EClockSec perAngle:perSecAngle];
}


- (void)moveMin
{
    [self moveHandWithLayer:self.minLayer clockType:EClockMin perAngle:perMinAngle];
}


- (void)moveHour
{
    [self moveHandWithLayer:self.hourLayer clockType:EClockHour perAngle:perHourAngle];
}


- (void)moveHandWithLayer:(CALayer *)layer clockType:(EClockType)clockType perAngle:(CGFloat)angle
{
    NSDateComponents *dateComponents = [self getCurrentDateComponents];
    NSInteger integer;
    
    switch (clockType)
    {
        case EClockSec:
            integer = dateComponents.second;
            NSLog(@"%s Second: %ld",__func__,(long)dateComponents.second);
            break;
            
        case EClockMin:
            integer = dateComponents.minute;
            NSLog(@"%s Minute: %ld",__func__,(long)dateComponents.minute);
            break;
        
        case EClockHour:
            integer = dateComponents.hour % 12;
            NSLog(@"%s Hour: %ld",__func__,(long)integer);
            break;
            
        default:
            return;
    }
    
    layer.transform = CATransform3DMakeRotation((angle2Rad(integer * angle)),0,0,1);
}

@end
