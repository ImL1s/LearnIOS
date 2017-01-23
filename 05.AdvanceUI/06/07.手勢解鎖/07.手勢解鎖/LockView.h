//
//  LockView.h
//  07.手勢解鎖
//
//  Created by ImL1s-MacPro on 2016/12/9.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import <UIKit/UIKit.h>

// 代理
@protocol LockViewDelegate <NSObject>

@required

- (NSString *) lockViewUserDefaultsPasswordKey;

@optional

// 第一次設定圖形密碼
- (void) lockViewFirstSetPassword:(NSString *)numbersString;

// 解鎖失敗
- (void) lockViewErrorPassword:(NSString *)errorPassword;

// 解鎖成功
- (void) lockViewCorrectPassword:(NSString *)correctPassword;

@end


@interface LockView : UIView

@property(nonatomic,weak) id<LockViewDelegate> delegate;

@property(nonatomic,strong) NSString *userDefaultsPasswordKey;

- (void)setUp;

@end
