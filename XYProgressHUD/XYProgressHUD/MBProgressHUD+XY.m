//
//  MBProgressHUD+XY.m
//  XYProgressHUD
//
//  Created by xiayingying on 2017/11/6.
//  Copyright © 2017年 xiayingying. All rights reserved.
//

#import "MBProgressHUD+XY.h"

@implementation MBProgressHUD (XY)

#pragma mark - 文字提示信息

+ (void)showToastMessageInWindow:(NSString *)message
{
    [self showXYToastMessage:message isWindow:YES delayTime:1.5];
}

+ (void)showToastMessageInView:(NSString *)message
{
    [self showXYToastMessage:message isWindow:NO delayTime:1.5];
}

+ (void)showToastMessageInWindow:(NSString *)message afterDelay:(NSInteger)seconds
{
    [self showXYToastMessage:message isWindow:YES delayTime:seconds];
}

+ (void)showToastMessageInView:(NSString *)message afterDelay:(NSInteger)seconds
{
    [self showXYToastMessage:message isWindow:NO delayTime:seconds];
}

#pragma mark - 加载状态的提示信息

+ (void)showLoadingMessageInWindow:(NSString *)message
{
    [self showXYLoadingMessage:message isWindow:YES delayTime:0];
}

+ (void)showLoadingMessageInView:(NSString *)message
{
    [self showXYLoadingMessage:message isWindow:NO delayTime:0];
}

+ (void)showLoadingMessageInWindow:(NSString *)message afterDelay:(NSInteger)seconds
{
    [self showXYLoadingMessage:message isWindow:YES delayTime:seconds];

}

+ (void)showLoadingMessageInView:(NSString *)message afterDelay:(NSInteger)seconds
{
    [self showXYLoadingMessage:message isWindow:NO delayTime:seconds];

}


#pragma mark - 带图片的提示信息
+ (void)showSuccessStatusMessage:(NSString *)message
{
    [self showXYStatusIcon:@"XYStatus-Success" message:message isWindow:YES];
}

+ (void)showInfoStatusMessage:(NSString *)message
{
    [self showXYStatusIcon:@"XYStatus-Info" message:message isWindow:YES];

}

+ (void)showErrorStatusMessage:(NSString *)message
{
    [self showXYStatusIcon:@"XYStatus-Error" message:message isWindow:YES];
}


+ (void)showCustomIconInWindow:(NSString *)iconName message:(NSString *)message{
    [self showXYStatusIcon:iconName message:message isWindow:YES];
}

+ (void)showCustomIconInView:(NSString *)iconName message:(NSString *)message{
    [self showXYStatusIcon:iconName message:message isWindow:NO];

}



#pragma mark - 隐藏显示的HUD

+ (void)hideHUD{
    
    UIView  *winView =(UIView*)[UIApplication sharedApplication].delegate.window;
    [self hideHUDForView:winView animated:YES];
    [self hideHUDForView:[self getCurrentUIVC].view animated:YES];

}


#pragma mark - PrivateMethod

+ (void)showXYToastMessage:(NSString *)message isWindow:(BOOL)isWindow delayTime:(NSInteger)seconds
{
    
    MBProgressHUD *hud = [self createXYProgressHUDWithMessage:message isInWindow:isWindow];
    hud.mode = MBProgressHUDModeText;
    hud.margin = 10;
    [hud hideAnimated:YES afterDelay:seconds];
    
}

+ (void)showXYLoadingMessage:(NSString *)message isWindow:(BOOL)isWindow delayTime:(NSInteger)seconds
{
    
    MBProgressHUD *hud = [self createXYProgressHUDWithMessage:message isInWindow:isWindow];
    hud.mode = MBProgressHUDModeIndeterminate;
    if (seconds > 0) {
        
        [hud hideAnimated:YES afterDelay:seconds];
    }
    
}


+ (void)showXYStatusIcon:(NSString *)iconName message:(NSString *)message isWindow:(BOOL)isWindow
{
    
    //展示前先隐藏
    [self hideHUD];
    
    MBProgressHUD *hud = [self createXYProgressHUDWithMessage:message isInWindow:isWindow];
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[@"" stringByAppendingPathComponent:iconName]]];
    hud.mode = MBProgressHUDModeCustomView;
    [hud hideAnimated:YES afterDelay:2.0];

}



+ (MBProgressHUD *)createXYProgressHUDWithMessage:(NSString *)message isInWindow:(BOOL)inWindow
{
    UIView *view = inWindow ? (UIView *)[UIApplication sharedApplication].delegate.window : [self getCurrentUIVC].view;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.label.text = message;
    hud.label.font = [UIFont systemFontOfSize:16];
    hud.removeFromSuperViewOnHide = YES;
    hud.margin = 15;
    return hud;
}



#pragma mark - 获取窗口显示的ViewController

+ (UIViewController *)getCurrentWindowVC
{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tempWindow in windows)
        {
            if (tempWindow.windowLevel == UIWindowLevelNormal)
            {
                window = tempWindow;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
    {
        result = nextResponder;
    }
    else
    {
        result = window.rootViewController;
    }
    return  result;
}


+ (UIViewController *)getCurrentUIVC
{
    UIViewController  *superVC = [[self class]  getCurrentWindowVC ];
    
    if ([superVC isKindOfClass:[UITabBarController class]]) {
        
        UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
        
        if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
        }
        return tabSelectVC;
    }else
        if ([superVC isKindOfClass:[UINavigationController class]]) {
            
            return ((UINavigationController*)superVC).viewControllers.lastObject;
        }
    return superVC;
}



@end
