
//
//  MainVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/16.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "MainVC.h"
#import "TChooseVC.h"
#import "SignVC.h"
#import "GradeVC.h"
#import "AnswerVC.h"
@interface MainVC ()
@property (weak, nonatomic) IBOutlet UIButton *oneBtn;
@property (weak, nonatomic) IBOutlet UIButton *twoBtn;
@property (weak, nonatomic) IBOutlet UIButton *threeBtn;
@property (weak, nonatomic) IBOutlet UIButton *fourBtn;
- (IBAction)clickOneBtn:(id)sender;
- (IBAction)clickTwoBtn:(id)sender;
- (IBAction)clickThreeBtn:(id)sender;
- (IBAction)clickFourBtn:(id)sender;

@end

@implementation MainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //先隐藏第四个
    self.fourBtn.hidden = YES;
    
    //判断是谁在登陆
    if ([UserDataManager obtainTeacherStatusForUser]) {
        //说明是导师登陆
        [self.oneBtn setTitle:@"布置作业" forState:UIControlStateNormal];
        [self.twoBtn setTitle:@"学生签到" forState:UIControlStateNormal];
        [self.threeBtn setTitle:@"学生成绩" forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (IBAction)clickOneBtn:(id)sender {
    
    if ([UserDataManager obtainTeacherStatusForUser]) {
        //老师
        self.hidesBottomBarWhenPushed = YES;
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Teacher" bundle:nil];
        TChooseVC *vc = [story instantiateViewControllerWithIdentifier:@"tchoose"];
        vc.title = @"选择类型";
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else{
    
        //学生
        self.hidesBottomBarWhenPushed = YES;
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        AnswerVC *vc = [story instantiateViewControllerWithIdentifier:@"answer"];
        vc.title = @"答题";
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}

- (IBAction)clickTwoBtn:(id)sender {
    
    //签到
    self.hidesBottomBarWhenPushed = YES;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignVC *vc = [story instantiateViewControllerWithIdentifier:@"sign"];
    vc.title = @"签到";
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)clickThreeBtn:(id)sender {
    
    //成绩
    self.hidesBottomBarWhenPushed = YES;
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    GradeVC *vc = [story instantiateViewControllerWithIdentifier:@"grade"];
    vc.title = @"成绩";
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
}

- (IBAction)clickFourBtn:(id)sender {
}
@end
