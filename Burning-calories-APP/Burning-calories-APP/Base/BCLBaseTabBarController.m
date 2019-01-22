//
//  BCLBaseTabBarController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/22.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLBaseTabBarController.h"

@interface BCLBaseTabBarController ()

@end

@implementation BCLBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)setCodeTabbarController:(NSMutableArray *)viewControllerMutableArray andviewControllerTitleMutableArray:(NSArray *)titleMutableArray{
    NSMutableArray *allNavigationController = [NSMutableArray array];
    for(int i = 0;i < viewControllerMutableArray.count; i++) {
        UINavigationController *everyNavigationController = [[UINavigationController alloc]initWithRootViewController:viewControllerMutableArray[i]];
        everyNavigationController.tabBarItem.image = [UIImage imageNamed:titleMutableArray[i]];
        [allNavigationController addObject:everyNavigationController];
    }
    self.viewControllers = allNavigationController;
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
