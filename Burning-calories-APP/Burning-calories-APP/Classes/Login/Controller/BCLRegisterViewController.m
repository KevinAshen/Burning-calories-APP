//
//  BCLRegisterViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/16.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLRegisterViewController.h"
#import "BCLRegisterView.h"

@interface BCLRegisterViewController ()

@property (nonatomic, strong) BCLRegisterView *registerView;

@end

@implementation BCLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.88f green:0.45f blue:0.53f alpha:1.00f];
    self.registerView = [[BCLRegisterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_registerView];
    
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
