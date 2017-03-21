//
//  TXztVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "TXztVC.h"

@interface TXztVC ()<UITextFieldDelegate>{

    NSInteger choose;//答案编号
    UIButton *oldBtn;//上一个按钮
}
@property (weak, nonatomic) IBOutlet UITextField *titleField;
@property (weak, nonatomic) IBOutlet UITextField *optionA;
@property (weak, nonatomic) IBOutlet UITextField *optionB;
@property (weak, nonatomic) IBOutlet UITextField *optionC;
@property (weak, nonatomic) IBOutlet UITextField *optionD;

- (IBAction)clickOkBtn:(UIButton *)sender;
- (IBAction)clickResultBtn:(UIButton *)sender;

@end

@implementation TXztVC

- (void)viewDidLoad {
    [super viewDidLoad];
    choose = 0;
}

//点击确认
- (IBAction)clickOkBtn:(UIButton *)sender {
    
    //判断是否已经完成出题
    if (self.titleField.text.length <= 0 || self.optionA.text.length <= 0 || self.optionB.text.length <= 0|| self.optionC.text.length <= 0|| self.optionD.text.length <= 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"请填写完成选项或者标题"];
        return;
    }
    if (choose == 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"请选择正确答案"];
        return;
    }
    __block typeof(self)weakSelf = self;
    [HttpManager xztSet:self.titleField.text andA:self.optionA.text andB:self.optionB.text andC:self.optionC.text andD:self.optionD.text andResult:choose success:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
        });
    } failure:^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [MBProgressHUD YFshowMessage:weakSelf.view showText:@"出题失败"];
        });
    }];
    
}

//选择答案
- (IBAction)clickResultBtn:(UIButton *)sender {
    
    oldBtn.selected = NO;
    sender.selected = YES;
    choose = sender.tag;
    oldBtn = sender;
}

//键盘消失
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    [self.view endEditing:YES];
    return YES;
}
@end
