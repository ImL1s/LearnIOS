//
//  AppDelegate.m
//  11.UITabBar設定內容
//
//  Created by ImL1s-MacPro on 2016/11/19.
//  Copyright © 2016年 ImL1s-MacPro. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] init];
    
    UINavigationController *nvC1 = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
    
    UIViewController *emptyController = [[UIViewController alloc] init];
    
    UINavigationController *nvC2 = [[UINavigationController alloc] initWithRootViewController:emptyController];
    

    
    UITabBarController *tabC = [[UITabBarController alloc] init];
    
    [tabC addChildViewController:nvC1];
    [tabC addChildViewController:nvC2];
    
    nvC1.view.backgroundColor = [UIColor purpleColor];
    emptyController.view.backgroundColor = [UIColor blueColor];
    
    // UITabBarController中的items在一開始為nil
    NSArray<UINavigationItem *> *items = tabC.tabBar.items;
    [[tabC.tabBar.items objectAtIndex:0] setTitle:@"Table2"];
//    [tabC.tabBar.items objectAtIndex:1].title = @"Table2";
    
    window.rootViewController = tabC;
    
    [window makeKeyAndVisible];
    
    self.window = window;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application
{
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
