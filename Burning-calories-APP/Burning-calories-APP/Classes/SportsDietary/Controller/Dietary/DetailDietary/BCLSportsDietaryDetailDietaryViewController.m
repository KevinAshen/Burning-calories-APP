//
//  BCLSportsDietaryDetailDietaryViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/3/18.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryDetailDietaryViewController.h"
#import "BCLSportsDietaryDetailDietaryView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BCLSportsDietaryDetailDietaryViewController ()<UITableViewDelegate>

//详细食谱界面
@property (nonatomic, strong) BCLSportsDietaryDetailDietaryView *sportsDietaryDetailDietaryView;

@end

@implementation BCLSportsDietaryDetailDietaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigation];
    [self setupSubview];
}

#pragma mark - 子视图设置
- (void)setupSubview {
    [self setupSportsDietaryDetailDietaryView];
}

#pragma mark - Navigation的设置
- (void)setupNavigation {
    self.navigationItem.title = @"早餐食谱";
}

#pragma mark - 详细食谱界面设置
- (void)setupSportsDietaryDetailDietaryView {
    self.sportsDietaryDetailDietaryView = [[BCLSportsDietaryDetailDietaryView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    [self.view addSubview:_sportsDietaryDetailDietaryView];
    
    [_sportsDietaryDetailDietaryView getDetailDietaryTableView].delegate = self;
}

#pragma mark - UITableViewDelegate协议实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
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
