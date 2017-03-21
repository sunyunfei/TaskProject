//
//  HttpManager.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/20.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking.h"
@implementation HttpManager
//请求方法
+(void)AFNsetting:(NSString *)httpStr
            param:(NSDictionary *)param
          success:(void(^)(id respond))successBlock
          failure:(void(^)())failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    [manager POST:httpStr parameters:param progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *code = responseObject[@"code"];
        if ([code intValue] == 1) {
            
            successBlock(responseObject);
        }else{
        
            failureBlock();
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        failureBlock();
    }];
    
}

//注册
+ (void)registerUser:(NSString *)account
              andPwd:(NSString *)pwd
             andType:(NSInteger)type
            andClass:(NSString *)className
             success:(void(^)())successBlock
             failure:(void(^)())failureBlock{

    
    NSString *httpS = @"http://localhost:8080/user/insertUser?";
    if (className.length <= 0) {
        className = @"教学部";
    }
    NSDictionary *para = @{@"account":account,@"password":pwd,@"type":@(type),@"classname":className};
    [HttpManager AFNsetting:httpS param:para success:^(id respond) {
        successBlock();
    } failure:^{
        failureBlock();
    }];
}

//登陆
+ (void)loginUser:(NSString *)account
           andPwd:(NSString *)pwd
          andType:(NSInteger)type
          success:(void(^)())successBlock
          failure:(void(^)())failureBlock{

    NSString *httpS = @"http://localhost:8080/user/queryUser?";
    NSDictionary *para = @{@"account":account,@"password":pwd,@"type":@(type)};
    [HttpManager AFNsetting:httpS param:para success:^(id respond) {
        
        //保存数据
        [UserDataManager saveUserData:account andName:respond[@"data"][@"userName"] andType:@(type) andPwd:pwd andClass:respond[@"data"][@"userClass"]];
        successBlock();
        
    } failure:^() {
        
        failureBlock();
    }];
}

//选择题布置
+ (void)xztSet:(NSString *)title
          andA:(NSString *)a
          andB:(NSString *)b
          andC:(NSString *)c
          andD:(NSString *)d
     andResult:(NSInteger)result
       success:(void(^)())successBlock
       failure:(void(^)())failureBlock{

    NSString *httpS = @"http://localhost:8080/choice/insertChoice?";
    NSDictionary *para = @{@"title":title,@"questiona":a,@"questionb":b,@"questionc":c,@"questiond":d,@"result":@(result)};
    [HttpManager AFNsetting:httpS param:para success:^(id respond) {
        
        successBlock();
    } failure:^{
       
        failureBlock();
    }];
}

//判断题
+ (void)pdtSet:(NSString *)title
     andResult:(NSInteger)result
       success:(void(^)())successBlock
       failure:(void(^)())failureBlock{

    NSString *httpS = @"http://localhost:8080/completion/insertCompletion?";
    NSDictionary *para = @{@"question":title,@"result":@(result)};
    [HttpManager AFNsetting:httpS param:para success:^(id respond) {
        
        successBlock();
    } failure:^{
        failureBlock();
    }];
}
@end
