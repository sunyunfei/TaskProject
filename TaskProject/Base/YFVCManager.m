//
//  YFVCManager.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/15.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "YFVCManager.h"
#import <UIKit/UIKit.h>
#import "LoginVC.h"
#import "BaseTabbarVC.h"
@implementation YFVCManager

//登陆界面的加载
+ (void)loadLoginVC{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    LoginVC *loginVc = [story instantiateViewControllerWithIdentifier:@"login"];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:loginVc];
    loginVc.title = @"登陆";
    [UIApplication sharedApplication].keyWindow.rootViewController = nav;
}

//加载分栏
+ (void)loadTabbarVC{

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    BaseTabbarVC *tabbarVC= [story instantiateViewControllerWithIdentifier:@"tabbar"];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVC;
}
@end
