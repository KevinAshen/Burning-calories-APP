//
//  AppDelegate.m
//  Burning-calories-APP
//
//  Created by 强淑婷 on 2019/1/22.
//  Copyright © 2019年 J&Q. All rights reserved.
//

#import "AppDelegate.h"
#import "BCLLogViewController.h"
#import "BCLCommunityViewController.h"
#import "BCLSportsDietaryViewController.h"
#import "BCLBaseTabBarController.h"

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *openViewController = [[UIViewController alloc] init];
    UIImageView *openImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"开机.jpg"]];
    [openViewController.view addSubview:openImageView];
    self.window.rootViewController = openViewController;
    
    [self performSelector:@selector(changeView) withObject:self afterDelay:2];
    [self performSelector:@selector(createButton) withObject:nil afterDelay:2];
    
    
    // Override point for customization after application launch.
    return YES;
}
#pragma mark - 工具栏
- (void)changeView {
    
    BCLLogViewController *logViewController = [[BCLLogViewController alloc]init];
    BCLSportsDietaryViewController *sportsDietaryViewController = [[BCLSportsDietaryViewController alloc]init];
    BCLCommunityViewController *communityController =
    [[BCLCommunityViewController alloc]init];
    
    NSMutableArray *viewControllerMutableArray = [NSMutableArray array];
    [viewControllerMutableArray addObject:logViewController];
    [viewControllerMutableArray addObject:sportsDietaryViewController];
    [viewControllerMutableArray addObject:communityController];
    
    NSArray *titleArray = @[@"bcl_ic_log_tabBar",@"bcl_ic_soprts_tabBar",@"bcl_ic_community_tabBar"];
    
    BCLBaseTabBarController *tabBarController = [[BCLBaseTabBarController alloc]init];
    self.window.rootViewController = tabBarController;
    [tabBarController setCodeTabbarController:viewControllerMutableArray andviewControllerTitleMutableArray:titleArray];

    [self.window makeKeyAndVisible];
}
-(void)createButton{
    if (!_button) {
        _window = [[UIApplication sharedApplication] keyWindow];
        _window.backgroundColor = [UIColor whiteColor];
        [_window addSubview:self.button];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:
                                       self action:@selector(locationChange:)];
        pan.delaysTouchesBegan = YES;
        [_button addGestureRecognizer:pan];
    }
}
- (UIButton*) button{
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.frame = CGRectMake(258, 450, 60, 60);//初始在屏幕上的位置
        [_button setImage:[UIImage imageNamed:@"bcl_btn_whole"] forState:UIControlStateNormal];
        //_button.layer.cornerRadius = 33;
        //_button.layer.masksToBounds = YES;
        //[_button addTarget:self action:@selector(removeButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button;
}
-(void)locationChange:(UIPanGestureRecognizer*)p{
    CGFloat HEIGHT=_button.frame.size.height;
    CGFloat WIDTH=_button.frame.size.width;
    BOOL isOver = NO;
    CGPoint panPoint = [p locationInView:[UIApplication sharedApplication].windows[0]];
    CGRect frame = CGRectMake(panPoint.x, panPoint.y, HEIGHT, WIDTH);
    NSLog(@"%f--panPoint.x-%f-panPoint.y-", panPoint.x, panPoint.y);
    if(p.state == UIGestureRecognizerStateChanged){
        _button.center = CGPointMake(panPoint.x, panPoint.y);
    }
    else if(p.state == UIGestureRecognizerStateEnded){
        if (panPoint.x + WIDTH > KScreenWidth) {
            frame.origin.x = KScreenWidth - WIDTH;
            isOver = YES;
        } else if (panPoint.y + HEIGHT > KScreenHeight) {
            frame.origin.y = KScreenHeight - HEIGHT;
            isOver = YES;
        } else if(panPoint.x - WIDTH / 2< 0) {
            frame.origin.x = 0;
            isOver = YES;
        } else if(panPoint.y - HEIGHT / 2 < 0) {
            frame.origin.y = 0;
            isOver = YES;
        }
        if (isOver) {
            [UIView animateWithDuration:0.3 animations:^{
                self.button.frame = frame;
            }];
        }
//        if(panPoint.x <= KScreenWidth/2) {
//            if(panPoint.y <= 40 + HEIGHT/2 && panPoint.x >= 20+WIDTH/2)  {
//                [UIView animateWithDuration:0.2 animations:^{
//                    self->_button.center = CGPointMake(panPoint.x, HEIGHT/2);
//                }];
//            } else if(panPoint.y >= KScreenHeight-HEIGHT/2-40 && panPoint.x >= 20+WIDTH/2){
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(panPoint.x, KScreenHeight - HEIGHT / 2);
//                }];
//            }  else if (panPoint.x < WIDTH/2+15 && panPoint.y > KScreenHeight-HEIGHT/2){
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(WIDTH/2, KScreenHeight-HEIGHT/2);
//                }];
//            }  else{
//                CGFloat pointy = panPoint.y < HEIGHT/2 ? HEIGHT/2 :panPoint.y;
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(WIDTH/2, pointy);
//                }];
//            }
//        }
//        else if(panPoint.x > KScreenWidth/2) {
//            if(panPoint.y <= 40+HEIGHT/2 && panPoint.x < KScreenWidth-WIDTH/2-20 ) {
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(panPoint.x, HEIGHT/2);
//                }];
//            }else if(panPoint.y >= KScreenHeight-40-HEIGHT/2 && panPoint.x < KScreenWidth-WIDTH/2-20) {
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(panPoint.x, KScreenHeight-HEIGHT/2);
//                }];
//            }else if (panPoint.x > KScreenWidth-WIDTH/2-15 && panPoint.y < HEIGHT/2) {
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(KScreenWidth-WIDTH/2, HEIGHT/2);
//                }];
//            } else{
//                CGFloat pointy = panPoint.y > KScreenHeight-HEIGHT/2 ? KScreenHeight-HEIGHT/2 :panPoint.y;
//                [UIView animateWithDuration:0.2 animations:^{
//                    _button.center = CGPointMake(KScreenWidth-WIDTH/2, pointy);
//                }];
//            }
//        }
    }
}

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
