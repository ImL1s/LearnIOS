//
//  ViewController.m
//  11.手勢識別(拖動旋轉縮放)
//
//  Created by ImL1s-MacPro on 2016/11/23.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIImageView *image;
@property (weak, nonatomic) IBOutlet UIImageView *imageV2;

@end

@implementation ViewController

- (UIImageView *)image
{
    if(_image == nil)
    {
        _image = [self addImg];
    }
    
    return _image;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self addImg];

    [self rotationGes];
    [self pinchGes];
    [self panGes];
}

- (UIImageView *) addImg
{
    UIImageView *iv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"35690-Re_ZeroKaraHajimeru_IsekaiSeikatsu-iPhone"]];
    
    [self.view addSubview:iv];
    
    CGSize cSize = [[UIScreen mainScreen] bounds].size;
    cSize.width *=0.5;
    cSize.height *= 0.5;
    
    CGPoint cPoint;
    cPoint.x = cSize.width;
    cPoint.y = cSize.height;
    
    cPoint.x -= cSize.width * 0.5;
    cPoint.y -= cSize.height * 0.5;
    
    CGRect cRect;
    cRect.origin = cPoint;
    cRect.size = cSize;
    
    iv.frame = cRect;
    
    iv.userInteractionEnabled = YES;
    
    return iv;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


// 手指拖動
- (void) panGes
{
    UIPanGestureRecognizer *pGR = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onPanGes:)];
    
    pGR.delegate = self;
    
    [self.image addGestureRecognizer:pGR];
//    [self.imageV2 addGestureRecognizer:pGR];
}

- (void) onPanGes:(UIPanGestureRecognizer *)pGR
{
    //获取偏移量(相对于最原始的偏移量,也就是取得第一次點擊到目前正在滑動中的距離)
    CGPoint transP = [pGR translationInView:self.image];
//    CGPoint transP2 = [pGR translationInView:self.imageV2];
    
//    NSLog(@"%@",NSStringFromCGPoint(transP));
    
    self.image.transform = CGAffineTransformTranslate(self.image.transform, transP.x, transP.y);
    // 使用這種方式會讓旋轉後移動方向不正常
//    self.image.transform = CGAffineTransformMake(self.image.transform.a, self.image.transform.b, self.image.transform.c, self.image.transform.d, transP.x, transP.y);
    
    //让它相对于上一次復位,也就是清空transP原始點的值
    [pGR setTranslation:CGPointZero inView:self.image];
}

// 縮放
- (void) pinchGes
{
    UIPinchGestureRecognizer *pGR = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinchGes:)];
    
    pGR.delegate = self;
    
    
    [self.image addGestureRecognizer:pGR];
}

- (void) onPinchGes:(UIPinchGestureRecognizer *)pGR
{
    self.image.transform = CGAffineTransformScale(self.image.transform, pGR.scale, pGR.scale);
    NSLog(@"onPinchGes");
    
    [pGR setScale:1];
}

// 旋轉
- (void) rotationGes
{
    UIRotationGestureRecognizer *rotationGR = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotationGes:)];
    
    rotationGR.delegate = self;
    
    [self.image addGestureRecognizer:rotationGR];
}

- (void) onRotationGes:(UIRotationGestureRecognizer *)rotationRecognizer
{
    self.image.transform = CGAffineTransformRotate(self.image.transform, rotationRecognizer.rotation);
    [rotationRecognizer setRotation:0];
    NSLog(@"onRotationGes");
}

// 是否可以多點觸控
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}


@end
