//
//  HttpManager.h
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/20.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpManager : NSObject
//注册
+ (void)registerUser:(NSString *)account
              andPwd:(NSString *)pwd
             andType:(NSInteger)type
            andClass:(NSString *)className
             success:(void(^)())successBlock
             failure:(void(^)())failureBlock;

//登陆
+ (void)loginUser:(NSString *)account
           andPwd:(NSString *)pwd
          andType:(NSInteger)type
          success:(void(^)())successBlock
          failure:(void(^)())failureBlock;

//选择题布置
+ (void)xztSet:(NSString *)title
          andA:(NSString *)a
          andB:(NSString *)b
          andC:(NSString *)c
          andD:(NSString *)d
     andResult:(NSInteger)result
       success:(void(^)())successBlock
       failure:(void(^)())failureBlock;

//判断题
+ (void)pdtSet:(NSString *)title
     andResult:(NSInteger)result
       success:(void(^)())successBlock
       failure:(void(^)())failureBlock;
@end
