//
//  MBProgressHUD+XY.h
//  XYProgressHUD
//
//  Created by xiayingying on 2017/11/6.
//  Copyright © 2017年 xiayingying. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (XY)

#pragma mark - 文字提示信息
+ (void)showToastMessageInWindow:(NSString *)message;
+ (void)showToastMessageInView:(NSString *)message;
+ (void)showToastMessageInWindow:(NSString *)message afterDelay:(NSInteger)seconds;
+ (void)showToastMessageInView:(NSString *)message afterDelay:(NSInteger)seconds;


#pragma mark - 加载状态的提示信息
+ (void)showLoadingMessageInWindow:(NSString *)message;
+ (void)showLoadingMessageInView:(NSString *)message;
+ (void)showLoadingMessageInWindow:(NSString *)message afterDelay:(NSInteger)seconds;
+ (void)showLoadingMessageInView:(NSString *)message afterDelay:(NSInteger)seconds;


#pragma mark - 带图片的提示信息
+ (void)showSuccessStatusMessage:(NSString *)message;
+ (void)showInfoStatusMessage:(NSString *)message;
+ (void)showErrorStatusMessage:(NSString *)message;


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message;

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message;


#pragma mark - 隐藏显示的HUD

+ (void)hideHUD;



@end
