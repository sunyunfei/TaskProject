//
//  AppDelegate.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/15.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "AppDelegate.h"
#import "YFVCManager.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [UserDataManager obtainLoginStatus] ? [YFVCManager loadTabbarVC] : [YFVCManager loadLoginVC] ;
    return YES;
}


@end
