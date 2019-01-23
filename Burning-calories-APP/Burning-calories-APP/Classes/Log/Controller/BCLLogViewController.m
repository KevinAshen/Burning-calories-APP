//
//  BCLLogViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLLogViewController.h"

@interface BCLLogViewController ()<UITableViewDelegate>

@property (nonatomic, strong) BCLLogView *logView;
@end

@implementation BCLLogViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"日志";
    
    _logView = [[BCLLogView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_logView];
    
    _logView.tableView = [self refreshBaseTableView];
    
    
    // Do any additional setup after loading the view.
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 250;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc]init];
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc]init];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
