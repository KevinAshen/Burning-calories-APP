//
//  BCLLoginViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/15.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLLoginViewController.h"
#import "BCLTabBarController.h"
#import "BCLLoginView.h"
#import "BCLRegisterViewController.h"

@interface BCLLoginViewController ()
@property (nonatomic ,strong)BCLLoginView *loginView;
@end

@implementation BCLLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    
    _loginView = [[BCLLoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_loginView];
    
    typeof(self) weakSelf = self;
    self.loginView.loginCallBackBlock = ^(UIButton *button, NSString *name) {
        [weakSelf login];
    };
    self.loginView.registerCallBackBlock = ^(UIButton *button) {
        [weakSelf registered];
    };
    // Do any additional setup after loading the view.
}
- (void)login {
    BCLTabBarController *tabBarController = [[BCLTabBarController alloc]init];
    [self presentViewController:tabBarController animated:YES completion:nil];
}
- (void)registered {
    BCLRegisterViewController *registerViewController = [[BCLRegisterViewController alloc] init];
    [self presentViewController:registerViewController animated:NO completion:nil];
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
