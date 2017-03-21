//
//  GradeVC.m
//  TaskProject
//
//  Created by 孙云飞 on 2017/3/18.
//  Copyright © 2017年 孙云飞. All rights reserved.
//

#import "GradeVC.h"

@interface GradeVC ()<UITableViewDelegate,UITableViewDataSource>
- (IBAction)clickTypeBtn:(UISegmentedControl *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *zyArray;//作业数据
@property(nonatomic,strong)NSMutableArray *signArray;//签到数据
@end

@implementation GradeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.zyArray = [NSMutableArray arrayWithArray:[UIFont familyNames]];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)clickTypeBtn:(UISegmentedControl *)sender {
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.zyArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = self.zyArray[indexPath.row];
    return cell;
}
@end
