//
//  BCLSportsDietaryViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLSportsDietaryViewController.h"
#import "BCLSportsDietaryRecordView.h"

@interface BCLSportsDietaryViewController ()<UIScrollViewDelegate>

//上半部分的分段控制器与饮食+健康的tableView
@property (nonatomic, strong) BCLSportsDietaryRecordView *sportsDietaryRecordView;

@end

@implementation BCLSportsDietaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupNavigation];
    [self setupSubview];
}

#pragma mark - 子视图设置
- (void)setupSubview {
    [self setupSportsDietaryRecordView];
}

#pragma mark - Navigation的设置
- (void)setupNavigation {
    self.navigationItem.title = @"饮食与健康";
}

#pragma mark - 上半部分SportsDietaryRecordView的设置
- (void)setupSportsDietaryRecordView {
    _sportsDietaryRecordView = [[BCLSportsDietaryRecordView alloc] initWithFrame:CGRectMake(0, 64, kDeviceWidth, 30)];  //30为虚值， 里面再替换
    [self.view addSubview:_sportsDietaryRecordView];
    
    [_sportsDietaryRecordView getBackgroundScrollView].delegate = self;
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
