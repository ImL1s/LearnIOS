 //
//  ViewController.m
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/12.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "ViewController.h"
#import "PanView.h"
#import "YSUIPictureView.h"

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,YSUIPictureViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *cleanBtn;

@property (weak, nonatomic) IBOutlet PanView *panView;


@end

@implementation ViewController

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [self.navigationController setToolbarHidden:NO animated:YES];
    
    self.cleanBtn.action = @selector(onClickCleanBtn);
    self.panView.pathWidth = 1;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - IBAction && onClick

// 清除按鈕
-(void)onClickCleanBtn
{
    [self.panView cleanAllPath];
}

// 上一步按鈕
- (IBAction)onBackBtnClick:(id)sender
{
    [self.panView backOneStep];
}

// 長寬設定
- (IBAction)onWidthSliderChanged:(UISlider *)sender
{
    self.panView.pathWidth = sender.value;
}

// 三個顏色按鈕
- (IBAction)onColorBtnClick:(UIButton *)colorBtn
{
    self.panView.state = PanViewStatePan;
    self.panView.pathColor = colorBtn.backgroundColor;
}

// 橡皮擦按鈕
- (IBAction)onEraseBtnClick:(UIBarButtonItem *)sender
{
    self.panView.state = PanViewStateErase;
    self.panView.pathColor = [UIColor whiteColor];
}

// 儲存按鈕
- (IBAction)onSaveBtnClick:(id)sender
{
    UIGraphicsBeginImageContextWithOptions(self.panView.bounds.size, NO, 0);
    
    CGContextRef ref = UIGraphicsGetCurrentContext();
    
    [self.panView.layer renderInContext:ref];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(onImageWriteToSavedPhotosAlnum:didFinishSavingWithError:contextInfo:), nil);
}

// 相片按鈕
- (IBAction)onPhotoBtnClick:(id)sender
{
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    
    [self presentViewController:imagePickerController animated:YES completion:nil];
}


#pragma mark - UIImagePicker delegate

// 選擇照片時調用此方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSLog(@"%@",info);
    
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    NSData *imageData = UIImageJPEGRepresentation(image, 1);
    // 將圖片儲存到路徑中
    [imageData writeToFile:@"/Users/iml1s-macpro/Desktop/myImage.jpg" atomically:YES];
    
// info dic 輸出內容
//    {
//        UIImagePickerControllerMediaType = "public.image";
//        UIImagePickerControllerOriginalImage = "<UIImage: 0x600000095a90> size {1668, 2500} orientation 0 scale 1.000000";
//        UIImagePickerControllerReferenceURL = "assets-library://asset/asset.JPG?id=99D53A1F-FEEF-40E1-8BB3-7DD55A43C8B7&ext=JPG";
//    }

    // YSUIPictureView是一個將imageView設為子控件方便將圖片當前的旋轉 位移 縮放記錄下來的View
    YSUIPictureView *pictureView = [[YSUIPictureView alloc] init];
    
    pictureView.frame = self.panView.frame;
    
    pictureView.image = image;
    
    pictureView.delegate = self;
    
    [self.view addSubview:pictureView];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - YSUIPictureViewDelegate

- (void)pictureView:(YSUIPictureView *)pictureView addNewImage:(UIImage *)newImage
{
    [self.panView addPictureImage:newImage];
    [pictureView removeFromSuperview];
}


#pragma mark - Other

- (void)onImageWriteToSavedPhotosAlnum:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSLog(@"onImageSave");
}

@end
