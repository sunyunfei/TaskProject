//
//  AboutVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/16.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "AboutVC.h"

@interface AboutVC ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation AboutVC

- (void)viewDidLoad {
   
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.textView.editable = NO;
}

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    [self.textView setContentOffset:CGPointMake(0, 0) animated:YES];
    
}

- (void)viewDidDisappear:(BOOL)animated{

    [super viewDidDisappear:animated];
    self.hidesBottomBarWhenPushed = NO;
}

@end
