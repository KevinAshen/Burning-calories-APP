//
//  BCLMineViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/6.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLMineViewController.h"
#import "BCLMineView.h"
#import "BCLMineTableView.h"

@interface BCLMineViewController ()<UITableViewDelegate>
@property (nonatomic, strong)BCLMineView *mineView;
@end

@implementation BCLMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"我的";
    
    self.mineView = [[BCLMineView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_mineView];
    self.mineView.mineTableView.delegate = self;
    // Do any additional setup after loading the view.
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        return 100;
    } else {
        return 60;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  0.0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.0;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
