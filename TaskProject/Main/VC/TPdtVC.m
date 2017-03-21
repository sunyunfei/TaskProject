//
//  TTktVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "TPdtVC.h"

@interface TPdtVC (){

    UIButton *oldBtn;
    NSInteger choose;
}
- (IBAction)clickOkBtn:(UIButton *)sender;
- (IBAction)clickResultBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleField;

@end

@implementation TPdtVC

- (void)viewDidLoad {
    [super viewDidLoad];
    choose = INT_MAX;
    
}

- (IBAction)clickOkBtn:(UIButton *)sender {
    
    if (_titleField.text.length <= 0) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"标题还没写呢"];
        return;
    }
    if (choose == INT_MAX) {
        
        [MBProgressHUD YFshowMessage:self.view showText:@"答案还没选呢"];
        return;
    }
    __block typeof(self)weakSelf = self;
    [HttpManager pdtSet:self.titleField.text andResult:choose success:^{
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
@end
