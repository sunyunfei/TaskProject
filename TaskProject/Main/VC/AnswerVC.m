//
//  AnswerVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/20.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "AnswerVC.h"

@interface AnswerVC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation AnswerVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.scrollView.pagingEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(10 * CGRectGetWidth(self.view.frame), 0);
    [self p_loadProblem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//添加题目
- (void)p_loadProblem{

    for(int i = 0;i < 10;i ++){
    
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i * CGRectGetWidth(self.view.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
        int rand = random() % 255;
        int rand2 = random() % 255;
        view.backgroundColor = [UIColor colorWithRed:rand * 1.0 / 255 green:rand2 * 1.0 / 255 blue:rand * 1.0 / 255 alpha:1.0];
        [self.scrollView addSubview:view];
    }
}
@end
