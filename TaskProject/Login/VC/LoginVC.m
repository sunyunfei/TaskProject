//
//  LoginVC.m
//  fdNews-iOS
//
//  Created by 孙云飞 on 2017/3/4.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "LoginVC.h"
#import "RegisterVC.h"
#import "YFVCManager.h"
@interface LoginVC ()
@property (weak, nonatomic) IBOutlet UITextField *mobileField;//账号
@property (weak, nonatomic) IBOutlet UITextField *pwdField;//密码
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchBtn;
- (IBAction)clickLoginBtn:(UIButton *)sender;//点击登陆
- (IBAction)clickRegisterBtn:(UIButton *)sender;//点击注册
- (IBAction)clickTyleBtn:(UISegmentedControl *)sender;//选择类型

@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//登陆
- (IBAction)clickLoginBtn:(UIButton *)sender {
    
    //判断账号和密码是否不为空
    if (self.mobileField.text.length <= 0 || self.pwdField.text.length <= 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"账号或者密码不能为空"];
        return;
    }
    
    //网络请求
    __block typeof(self)weakSelf = self;
    [HttpManager loginUser:self.mobileField.text andPwd:self.pwdField.text andType:self.switchBtn.selectedSegmentIndex success:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD YFshowMessage:weakSelf.view showText:@"登陆成功"];
            [weakSelf performSelector:@selector(loginSuccess) withObject:weakSelf afterDelay:1.0f];
            
        });
    } failure:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [MBProgressHUD YFshowMessage:weakSelf.view showText:@"账号或者密码错误"];
        });
    }];
    
}

//登陆成功
- (void)loginSuccess{

    [YFVCManager loadTabbarVC];
}
//注册
- (IBAction)clickRegisterBtn:(UIButton *)sender {
    
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    RegisterVC *vc = [story instantiateViewControllerWithIdentifier:@"register"];
    vc.title =@"注册";
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)clickTyleBtn:(UISegmentedControl *)sender {
}
@end
