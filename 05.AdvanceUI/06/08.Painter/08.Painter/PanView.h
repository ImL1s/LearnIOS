//
//  PanView.h
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/13.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum PanViewState
{
    PanViewStatePan,
    PanViewStateErase
    
} PanViewState;

@interface PanView : UIView

// 新加入的image,將會馬上繪製到當前的View中
@property(strong,nonatomic) UIImage *pictureImage;

@property (assign,nonatomic) CGFloat pathWidth;     // 畫筆粗細

@property(strong,nonatomic) UIColor *pathColor;     // 畫筆顏色

@property(assign,nonatomic) PanViewState state;     // 畫筆狀態

-(void) cleanAllPath;

-(void) backOneStep;

// 向畫板中加入一個圖片
-(void) addPictureImage:(UIImage *)pictureImage;

@end
