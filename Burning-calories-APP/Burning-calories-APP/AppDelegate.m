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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIViewController *openViewController = [[UIViewController alloc] init];
    UIImageView *openImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"开机.jpg"]];
    [openViewController.view addSubview:openImageView];
    self.window.rootViewController = openViewController;
    
    [self performSelector:@selector(changeView) withObject:self afterDelay:2];
    
    // Override point for customization after application launch.
    return YES;
}
- (void)changeView {
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    self.window.rootViewController = tabBarController;
    
    BCLLogViewController *logViewController = [[BCLLogViewController alloc]init];
    logViewController.tabBarItem.image = [UIImage imageNamed:@"首页"];
    
    BCLSportsDietaryViewController *sportsDietaryViewController = [[BCLSportsDietaryViewController alloc]init];
    sportsDietaryViewController.tabBarItem.image = [UIImage imageNamed: @"运动"];
    
    BCLCommunityViewController *communityController =
    [[BCLCommunityViewController alloc]init];
    communityController.tabBarItem.image = [UIImage imageNamed:@"社区"];
    
    UINavigationController *logNavigationController = [[UINavigationController alloc]initWithRootViewController:logViewController];
    UINavigationController *sportsDietaryNavigationController = [[UINavigationController alloc]initWithRootViewController:sportsDietaryViewController];
    UINavigationController *communityNavigationController = [[UINavigationController alloc]initWithRootViewController:communityController];
    
    tabBarController.viewControllers = @[logNavigationController, sportsDietaryNavigationController, communityNavigationController];
    [self.window makeKeyAndVisible];
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
