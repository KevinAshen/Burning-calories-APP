//
//  BCLSportsDietaryAddSportsListViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/2/26.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListViewController.h"
#import "BCLSportsDietaryDetailDietaryViewController.h"
#import "BCLSportsDietaryAddSportsListView.h"
#import "BCLSportsDietaryAddSportsListTagView.h"
#import "BCLSportsDietaryAddSportsBounceView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BCLSportsDietaryAddSportsListViewController ()<UITabBarDelegate, UITableViewDelegate>

//增加运动主页面
@property (nonatomic, strong) BCLSportsDietaryAddSportsListView *sportsDietaryAddSportsListView;
//遮盖View
@property (nonatomic, strong) BCLSportsDietaryAddSportsBounceView *sportsDietaryAddSportsBounceView;

//详细食谱ViewController
@property (nonatomic, strong) BCLSportsDietaryDetailDietaryViewController *sportsDietaryDetailDietaryViewController;

@end

@implementation BCLSportsDietaryAddSportsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupSubview];
}

#pragma mark - 子视图设置
- (void)setupSubview {
    [self setupSportsDietaryAddSportsListView];
}

#pragma mark - Navigation的设置
- (void)setupNavigation {
    self.navigationItem.title = @"饮食与健康";
}


#pragma mark - 增加运动主页面设置
- (void)setupSportsDietaryAddSportsListView {
    self.sportsDietaryAddSportsListView = [[BCLSportsDietaryAddSportsListView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, kDeviceHeight)];
    [self.view addSubview:_sportsDietaryAddSportsListView];
    
    self.sportsDietaryAddSportsListView.addSportsTableView.delegate = self;
}

#pragma mark - UITableViewDelegate实现
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //!!!TEST!!!
    return 60;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth - 36 - 36, 15)];
    headView.backgroundColor = [UIColor clearColor];
    return headView;
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
