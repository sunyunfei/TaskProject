//
//  UserDataManager.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "UserDataManager.h"
static NSString *login_type = @"type";//学生登陆还是老师登陆
static NSString *login_account = @"account";
static NSString *login_name = @"name";
static NSString *login_pwd = @"pwd";
static NSString *login_status =@"status";
static NSString *login_class = @"class";
@implementation UserDataManager

//保存个人信息
+ (void)saveUserData:(NSString *)account andName:(NSString *)name andType:(NSNumber *)type andPwd:(NSString *)pwd andClass:(NSString *)className{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:[type intValue] forKey:login_type];
    [defaults setObject:account forKey:login_account];
    [defaults setObject:name forKey:login_name];
    [defaults setObject:pwd forKey:login_pwd];
    [defaults setBool:YES forKey:login_status];
    [defaults setObject:className forKey:login_class];
    [defaults synchronize];
}

//获取登陆状态是学生还是老师
+ (BOOL)obtainTeacherStatusForUser{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:login_type];
}

//获取姓名
+ (NSString *)obtainName{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:login_name];
}

//获取账号
+ (NSString *)obtainAccount{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:login_account];
}

//获取密码
+ (NSString *)obtainPassword{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:login_pwd];
}

//获取是否登陆
+ (BOOL)obtainLoginStatus{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults boolForKey:login_status];
}

//获取班级
+ (NSString *)obtainClassName{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:login_class];
}

//数据注销
+ (void)deleteLocationData{

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:login_class];
    [defaults removeObjectForKey:login_pwd];
    [defaults removeObjectForKey:login_account];
    [defaults removeObjectForKey:login_name];
    [defaults removeObjectForKey:login_type];
    [defaults removeObjectForKey:login_status];
    [defaults synchronize];
}
@end
