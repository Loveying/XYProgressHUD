//
//  ViewController.m
//  XYProgressHUD
//
//  Created by xiayingying on 2017/11/6.
//  Copyright © 2017年 xiayingying. All rights reserved.
//

#import "ViewController.h"
#import "MBProgressHUD.h"
#import "MBProgressHUD+XY.h"
#import <Foundation/Foundation.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showTextMessage:(id)sender {
    
    
    //[MBProgressHUD showToastMessageInView:@"啦啦啦"];
    
    //[MBProgressHUD showToastMessageInWindow:@"哈哈哈" afterDelay:2];
    
    //[MBProgressHUD showPeogressMessage:@"上传。。。"];
    
    //[self performSelector:@selector(disMisstion) withObject:sender afterDelay:3];
    
}

- (void)disMisstion{
    [MBProgressHUD hideHUD];
}

- (IBAction)showActivity:(id)sender {
    
    [MBProgressHUD showLoadingMessageInView:nil afterDelay:2];
//    [MBProgressHUD showLoadingMessageInView:@"正在加载..." ];
}
- (IBAction)showIconMessage:(id)sender {
    [MBProgressHUD showSuccessStatusMessage:@"加载成功"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
