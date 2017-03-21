//
//  MineVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/16.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "MineVC.h"
#import "YFVCManager.h"
@interface MineVC ()
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;//头像
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UILabel *tineLabel;
- (IBAction)clickOutBtn:(id)sender;

@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconBtn.layer.cornerRadius = 50;
    self.iconBtn.layer.masksToBounds = YES;
    
    if([UserDataManager obtainTeacherStatusForUser]){
    
        [self.iconBtn setBackgroundImage:[UIImage imageNamed:@"teacher.jpg"] forState:UIControlStateNormal];
        self.tineLabel.text = @"部门";
    }
    
    //数据赋予
    self.classLabel.text = [UserDataManager obtainClassName];
    self.nameLabel.text = [UserDataManager obtainName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//推出登陆事件
- (IBAction)clickOutBtn:(id)sender {
    
    //注销数据
    [UserDataManager deleteLocationData];
    //调出登陆界面
    [YFVCManager loadLoginVC];
}
@end
