//
//  BCLTabBarController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/13.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLTabBarController.h"
#import "BCLLogViewController.h"
#import "BCLCommunityViewController.h"
#import "BCLSportsDietaryViewController.h"
#import "BCLMineViewController.h"
#import "BCLCustomTabBar.h"
#import "BCLBounceView.h"

@interface BCLTabBarController ()

///弹出的选择框
@property (nonatomic, strong) BCLBounceView *bounceView;

@end

@implementation BCLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    BCLCustomTabBar *customTabBar = [[BCLCustomTabBar alloc] init];
    [self setValue:customTabBar forKey:@"tabBar"];
    
    [customTabBar.centerButton addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    BCLLogViewController *logViewController = [[BCLLogViewController alloc]init];
    BCLSportsDietaryViewController *sportsDietaryViewController = [[BCLSportsDietaryViewController alloc]init];
    BCLCommunityViewController *communityController =
    [[BCLCommunityViewController alloc]init];
    BCLMineViewController *mineViewController= [[BCLMineViewController alloc] init];
    
    NSMutableArray *viewControllerMutableArray = [NSMutableArray array];
    [viewControllerMutableArray addObject:logViewController];
    [viewControllerMutableArray addObject:sportsDietaryViewController];
    [viewControllerMutableArray addObject:communityController];
    [viewControllerMutableArray addObject:mineViewController];
    
    NSArray *titleArray = @[@"bcl_ic_log_tabBar",@"bcl_ic_soprts_tabBar",@"bcl_ic_community_tabBar",@"bcl_ic_mine_tabBar"];
    [self setCodeTabbarController:viewControllerMutableArray andviewControllerTitleMutableArray:titleArray];
    // Do any additional setup after loading the view.
}

- (void)clickCenterBtn:(UIButton *)button {
    self.bounceView = [[BCLBounceView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height)];
    [_bounceView showInView:self.view];
    NSLog(@"fdsfs");
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
