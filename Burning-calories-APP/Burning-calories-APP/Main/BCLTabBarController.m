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
#import "BCLSelectFinishViewController.h"
#import "BCLMineViewController.h"
#import "BCLCustomTabBar.h"
#import "BCLBounceView.h"

@interface BCLTabBarController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

///弹出的选择框
@property (nonatomic, strong) BCLBounceView *bounceView;
@property (nonatomic, strong) BCLCustomTabBar *customTabBar;

@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) UIImageView *testImageView;

@end

@implementation BCLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    _customTabBar = [[BCLCustomTabBar alloc] init];
    [self setValue:_customTabBar forKey:@"tabBar"];
    
    [_customTabBar.centerButton addTarget:self action:@selector(clickCenterBtn:) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    [self removeTabBarTopLine];
    // Do any additional setup after loading the view.
}

#pragma mark--隐藏tabBar顶部线条
- (void)removeTabBarTopLine {
    CGRect rect = CGRectMake(0, 0, k_screen_width, k_screen_height);
    UIGraphicsBeginImageContext(rect.size);
    //2G画布
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
}

- (void)clickCenterBtn:(UIButton *)button {
    self.bounceView = [[BCLBounceView alloc] initWithFrame:CGRectMake(0, 0, k_screen_width, k_screen_height)];
    
    [_bounceView showInView:self.view];
    _bounceView.buttonAction = ^(NSInteger tag) {
        [self addFoodPhotoWithTag:tag];
    };
    NSLog(@"fdsfs");
}

- (void)addFoodPhotoWithTag:(NSInteger)tag {
    self.imagePickerController = [[UIImagePickerController alloc] init];
    _imagePickerController.delegate = self;
    
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            return;
        }
        self.imagePickerController.allowsEditing = NO;
        
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    [alertVc addAction:cameraAction];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            return;
        }
        self.imagePickerController.allowsEditing = NO;
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }];
    [alertVc addAction:albumAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:nil];
    [alertVc addAction:cancelAction];
    
    [self presentViewController:alertVc animated:YES completion:nil];
    NSLog(@"XXXX%ldXXXX", tag);
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    BCLSelectFinishViewController *selectFinishViewController = [[BCLSelectFinishViewController alloc] init];
    UIImage *pickImage = info[UIImagePickerControllerOriginalImage];
    NSLog(@"%@", pickImage);
    [selectFinishViewController.selectImageButton setImage:pickImage forState:UIControlStateNormal];
    [picker presentViewController:selectFinishViewController animated:YES completion:nil];
    
//    //销毁控制器
//    [picker dismissViewControllerAnimated:YES completion:nil];
//    //设置图片
//    self.testImageView = [[UIImageView alloc] init];
//    _testImageView.image = info[UIImagePickerControllerOriginalImage];
//    NSLog(@"%@FAILQSTZZ", _testImageView.image);
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"FAILQSTSD");
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
