//
//  BCLBaseViewController.m
//  Burning-calories-APP
//
//  Created by mac on 2019/1/               23.
//  Copyright © 2019 J&Q. All rights reserved.
//

#import "BCLBaseViewController.h"

@interface BCLBaseViewController ()

@end

@implementation BCLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupBaseSetting];
    //[self setupLeftBarButton];
}

#pragma mark - 基础设定
- (void)setupBaseSetting {
    // 设置应用的背景色
    //self.view.backgroundColor = [UIColor whiteColor];
    //设置背景图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"caloriesbg"];
    [self.view insertSubview:imageView atIndex:0];
    
}

#pragma mark - 自定义返回按钮
- (void)setupLeftBarButton {
    // 自定义 leftBarButtonItem ，UIImageRenderingModeAlwaysOriginal 防止图片被渲染
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]
                                             initWithImage:[[UIImage
                                                             imageNamed:@"Back-蓝"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                             style:UIBarButtonItemStylePlain
                                             target:self
                                             action:@selector(leftBarButtonClick)];
    // 防止返回手势失效
    self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
}

#pragma mark - 返回按钮的点击事件
- (void)leftBarButtonClick {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TableView的设置
//- (UITableView *)refreshBaseTableView {
//    UITableView *baseTableView = [self setupBaseTableView];
//    baseTableView.delegate = self;
//    baseTableView.showsVerticalScrollIndicator = NO;
//    baseTableView.showsHorizontalScrollIndicator = NO;
//    baseTableView.bounces = NO;
//    baseTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
//    baseTableView.backgroundColor = [UIColor whiteColor];
//    return baseTableView;
//}
//
//- (UITableView *)setupBaseTableView {
//    UITableView *baseTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    return baseTableView;
//}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
