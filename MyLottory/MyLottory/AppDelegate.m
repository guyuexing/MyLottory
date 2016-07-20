//
//  AppDelegate.m
//  MyLottory
//
//  Created by guyuexing on 16/5/14.
//  Copyright © 2016年 neu. All rights reserved.
//

#import "AppDelegate.h"
#import "ZHTabBarController.h"
#import "ZHGuideController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ZHGuideController *guideVc = [[ZHGuideController alloc] init];
    ZHTabBarController *tabBarVc = [[ZHTabBarController alloc] init];
    
    
    if ([self bundleIsEqual]) {
        self.window.rootViewController = tabBarVc;
    }else{
        self.window.rootViewController = guideVc;
    }
 
    [self.window makeKeyAndVisible];
    
    //application.statusBarStyle = UIStatusBarStyleLightContent;
    
    return YES;
}

- (BOOL)bundleIsEqual{
    
    NSDictionary *dict = [NSBundle mainBundle].infoDictionary;
    NSString *newID = dict[@"CFBundleShortVersionString"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *oldID = [defaults objectForKey:@"Bundle"];
    
    if ([newID isEqualToString:oldID]) {
        //相等，跳转到UITabBarController
        return YES;
    }else{
        //不相等，跳转到新特性控制器
        [defaults setObject:newID forKey:@"Bundle"];
        return NO;
    }
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
