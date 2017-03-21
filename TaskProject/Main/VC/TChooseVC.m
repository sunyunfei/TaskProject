//
//  TChooseVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "TChooseVC.h"
#import "TXztVC.h"
#import "TPdtVC.h"
@interface TChooseVC ()

@end

@implementation TChooseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        self.hidesBottomBarWhenPushed = YES;
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Teacher" bundle:nil];
        TXztVC *vc = [story instantiateViewControllerWithIdentifier:@"xzt"];
        vc.title = @"选择题";
        [self.navigationController pushViewController:vc animated:YES];
    }else{
    
        self.hidesBottomBarWhenPushed = YES;
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Teacher" bundle:nil];
        TPdtVC *vc = [story instantiateViewControllerWithIdentifier:@"pdt"];
        vc.title = @"判断题";
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
