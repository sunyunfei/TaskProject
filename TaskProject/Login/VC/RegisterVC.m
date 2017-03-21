//
//  RegisterVC.m
//  fdNews-iOS
//
//  Created by 孙云飞 on 2017/3/4.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "RegisterVC.h"

@interface RegisterVC ()
@property (weak, nonatomic) IBOutlet UITextField *mobileField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UIView *classFootView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *switchBtn;
- (IBAction)clickRegisterBtn:(UIButton *)sender;
- (IBAction)clickTyleBtn:(UISegmentedControl *)sender;
@end

@implementation RegisterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//注册按钮
- (IBAction)clickRegisterBtn:(UIButton *)sender {
    
    //判断是否有空
    if (self.mobileField.text.length <= 0 || self.pwdField.text.length <= 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"账号或者密码格式不对"];
        return;
    }
    
    if (self.switchBtn.selectedSegmentIndex == 0 && self.codeField.text.length<= 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"班级被你丢弃了吗"];
        return;
    }
    
    //注册
    __block typeof(self)weakSelf = self;
    [HttpManager registerUser:self.mobileField.text andPwd:self.pwdField.text andType:self.switchBtn.selectedSegmentIndex andClass:self.codeField.text success:^{
        
       dispatch_async(dispatch_get_main_queue(), ^{
          
           [MBProgressHUD YFshowMessage:weakSelf.view showText:@"注册成功,请登陆"];
           [weakSelf performSelector:@selector(returnLogin) withObject:weakSelf afterDelay:1.0f];
       });
    } failure:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD YFshowMessage:weakSelf.view showText:@"注册失败，请检查"];
        });
    }];
    
}

//选择类型
- (IBAction)clickTyleBtn:(UISegmentedControl *)sender {
    
    //类型判断
    if (sender.selectedSegmentIndex == 1) {
        //说明是老师
        self.classLabel.hidden = YES;
        self.classFootView.hidden = YES;
        self.codeField.hidden = YES;
        self.codeField.text = @"";
    }else{
    
        //说明是学生
        self.classLabel.hidden = NO;
        self.classFootView.hidden = NO;
        self.codeField.hidden = NO;
    }
}
//返回登陆界面
- (void)returnLogin{

    [self.navigationController popViewControllerAnimated:YES];
}
@end
