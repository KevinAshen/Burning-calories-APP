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

@interface BCLTabBarController ()


@end

@implementation BCLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setValue:[[BCLCustomTabBar alloc] init] forKey:@"tabBar"];
    
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
