//
//  YSUIPictureView.h
//  08.Painter
//
//  Created by ImL1s-MacPro on 2016/12/14.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSUIPictureView;
@protocol YSUIPictureViewDelegate <NSObject>

- (void)pictureView:(YSUIPictureView *)pictureView  addNewImage:(UIImage *)newImage;

@end

@interface YSUIPictureView : UIView

@property id<YSUIPictureViewDelegate> delegate;

@property(nonatomic,strong)UIImage *image;

@end
