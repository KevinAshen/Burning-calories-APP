//
//  AppDelegate.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/22.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "AppDelegate.h"
#import "BCLTabBarController.h"
#import "BCLLoginViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong)UIViewController *openViewController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    _openViewController = [[UIViewController alloc] init];
    UIImageView *openImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"开机.jpg"]];
    [_openViewController.view addSubview:openImageView];
    self.window.rootViewController = self.openViewController;
    
    [self performSelector:@selector(changeView) withObject:self afterDelay:2];
    
    // Override point for customization after application launch.
    return YES;
}
#pragma mark - 工具栏
- (void)changeView {
    BCLLoginViewController *loginViewController = [[BCLLoginViewController alloc] init];
    
    [self.openViewController presentViewController:loginViewController animated:YES completion:nil];

    [self.window makeKeyAndVisible];
}
//-(void)createButton{
//    if (!_button) {
//         _button = [[BCLSuspensionButton alloc] init];
//
//        _window = [[UIApplication sharedApplication] keyWindow];
//        _window.backgroundColor = [UIColor whiteColor];
//        [_window addSubview:self.button];
//        [_button addTarget:self action:@selector(addClick:) forControlEvents:UIControlEventTouchUpInside];
//    }
//}
//
////打开四种识别分类
//- (void)chooseClassify:(UIButton *)btn {
//
//}
//
//- (void)addClick:(UIButton *)btn {
//    _imagePicker = [[UIImagePickerController alloc]init];
//    _imagePicker.delegate = self;
//
//    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//
//    }];
//
//    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"打开相机"  style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        //相机捕获类型
//        //imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
//        self->_imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        [self.tabBarController presentViewController:self->_imagePicker animated:YES completion:nil];
//    }];
//    UIAlertAction *picture = [UIAlertAction actionWithTitle:@"打开相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        self->_imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        [self.tabBarController presentViewController:self->_imagePicker animated:YES completion:nil];
//        //[BCLPhotosManager showPhotosManager:self withMaxImageCount:9 withAlbumModel:self.albumModel withAlbumArray:^(NSMutableArray<BCLPhotoModel *> *albumArray) {
//            //NSLog(@"%@", albumArray);
//        //}];
//
//    }];
//
//    [alertVc addAction:cancel];
//    [alertVc addAction:camera];
//    [alertVc addAction:picture];
//    [self.tabBarController presentViewController:alertVc animated:YES completion:nil];
//}
//#pragma mark - imagePickerController delegate
//- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
//
//    //获取到的图片
//    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
//    //UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinshSavingWithError:contextInfo:), nil);
//
//    BCLSelectFinishViewController *new = [[BCLSelectFinishViewController alloc] init];
//    new.selectImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    [new.selectImageButton setImage:image forState:UIControlStateNormal];
//    [picker presentViewController:new animated:YES completion:nil];
//}
////取消获取照片
//- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
//{
//    [self.tabBarController dismissViewControllerAnimated:YES completion:nil];
//}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
