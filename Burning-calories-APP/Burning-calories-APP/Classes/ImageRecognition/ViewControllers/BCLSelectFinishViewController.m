//
//  BCLSelectFinishViewController.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/5/5.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "BCLSelectFinishViewController.h"

@interface BCLSelectFinishViewController ()

@end

@implementation BCLSelectFinishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationItem.title = @"Camera";
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"bcl_ic_imageRecognition_tabBar"] forState:UIControlStateNormal];
    UIButton *rightBUtton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBUtton setTitle:@"library" forState:UIControlStateNormal];
    [rightBUtton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    
    self.navigationItem.leftBarButtonItem = leftBarButton;
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithCustomView:rightBUtton];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
    self.view.backgroundColor = [UIColor yellowColor];

    _selectImageButton.frame = CGRectMake(65, 170, 300, 300);
    [self.view addSubview:_selectImageButton];
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
