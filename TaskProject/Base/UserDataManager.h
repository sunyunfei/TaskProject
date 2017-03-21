//
//  UserDataManager.h
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDataManager : NSObject
//保存个人信息
+ (void)saveUserData:(NSString *)account andName:(NSString *)name andType:(NSNumber *)type andPwd:(NSString *)pwd andClass:(NSString *)className;
//获取登陆状态是学生还是老师
+ (BOOL)obtainTeacherStatusForUser;
//获取姓名
+ (NSString *)obtainName;
//获取账号
+ (NSString *)obtainAccount;
//获取密码
+ (NSString *)obtainPassword;
//获取是否登陆
+ (BOOL)obtainLoginStatus;

//获取班级
+ (NSString *)obtainClassName;
//数据注销
+ (void)deleteLocationData;
@end
