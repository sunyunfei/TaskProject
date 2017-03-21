//
//  SignVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "SignVC.h"

@interface SignVC ()
@property (weak, nonatomic) IBOutlet UIButton *signBtn;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
- (IBAction)clickSignBtn:(UIButton *)sender;

@end

@implementation SignVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.signBtn.layer.cornerRadius = 75;
    self.signBtn.layer.masksToBounds = YES;
    
    if ([UserDataManager obtainTeacherStatusForUser]) {
        [self.signBtn setTitle:@"点击学生开始签到" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

//签到按钮
- (IBAction)clickSignBtn:(UIButton *)sender {
    
    self.resultLabel.text = @"显示获取到的签到位置";
    if ([UserDataManager obtainTeacherStatusForUser]) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"请到学生成绩界面查看签到数据"];
    }else{
    
        [MBProgressHUD YFshowMessage:self.view showText:@"签到成功，请返回"];
    }
}
@end
