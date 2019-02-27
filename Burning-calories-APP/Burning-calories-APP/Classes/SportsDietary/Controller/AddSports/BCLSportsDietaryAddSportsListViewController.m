//
//  BCLSportsDietaryAddSportsListViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/2/26.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryAddSportsListViewController.h"
#import "BCLSportsDietaryAddSportsListView.h"

#define kDeviceWidth [UIScreen mainScreen].bounds.size.width
#define kDeviceHeight [UIScreen mainScreen].bounds.size.height

@interface BCLSportsDietaryAddSportsListViewController ()

//增加运动主页面
@property (nonatomic, strong) BCLSportsDietaryAddSportsListView *sportsDietaryAddSportsListView;

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
