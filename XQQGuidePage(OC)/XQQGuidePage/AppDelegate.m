//
//  AppDelegate.m
//  XQQGuidePage
//
//  Created by XQQ on 16/8/16.
//  Copyright © 2016年 UIP. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "XQQGuidePageController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    //得到版本号
    NSDictionary * infoDict = [NSBundle mainBundle].infoDictionary;
    
    NSString * currentAppVersion = infoDict[@"CFBundleShortVersionString"];
    //取出之前保存的版本号
    NSUserDefaults * defaultUser =  [NSUserDefaults standardUserDefaults];
    NSString * appVersion = [defaultUser stringForKey:@"appVersion"];
    //如果appVersion为空 第一次启动  如果 appVersion != currentAppVersion 说明是更新了
    if ([appVersion isEqualToString:@""]||appVersion == nil||appVersion !=currentAppVersion ) {
        //保存最新的版本号
        [defaultUser setValue:currentAppVersion forKey:@"appVersion"];
        XQQGuidePageController * guideVC = [[XQQGuidePageController alloc]init];
        self.window.rootViewController = guideVC;
    }else{
        [self enterMainVC];
    }
    return YES;
}

- (void)enterMainVC{
    
    //XQQGuidePageController
    //mainViewController
    mainViewController * mainVC = [[mainViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:mainVC];
    self.window.rootViewController = nav;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
