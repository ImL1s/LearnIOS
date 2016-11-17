//
//  AppDelegate.m
//  2.CteateController
//
//  Created by yushanglung on 2016/10/8.
//  Copyright © 2016年 yushanglung. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    UIWindow *mWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    

//    UIViewController *mainController = [self createByStoryboardDefault:mWindow];
//    UIViewController *secondController = [self createByStoryboardSpecifiedSID:mWindow storyBoardID:@"secondView"];
//    UIViewController *directController = [self directCteateController];
    UIViewController *xibController = [self createByXib];
    UIViewController *storyboardController = [self createByStoryboardDefault];
    
//    mWindow.rootViewController = mainController;
//    mWindow.rootViewController = secondController;
//    mWindow.rootViewController = directController;
    mWindow.rootViewController = xibController;
    mWindow.rootViewController = storyboardController;
    
    [mWindow makeKeyAndVisible];
    
    self.window = mWindow;
   
    
    return YES;
}

// 取得箭頭所指的ViewController
- (UIViewController *) createByStoryboardDefault
{
    // 取得MainStoreboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
     // 取得Storeboard箭頭(入口)所指向的ViewController
    UIViewController *mainController = [storyboard instantiateInitialViewController];

    return mainController;
}

// 取得指定的UIViewController
- (UIViewController *) createByStoryboardSpecifiedSID:(UIWindow *)window storyBoardID:(NSString *)sID
{
    // 取得MainStoreboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    // 使用Identify->StoryboardID 取得Story下指定的Storyboard
    UIViewController *secondController = [storyboard instantiateViewControllerWithIdentifier:@"secondView"];
    
    return secondController;
}

// 直接創建控制器
- (UIViewController *) directCteateController
{
    UIViewController *controller = [[UIViewController alloc] init];
    controller.view.backgroundColor = [UIColor redColor];
    return controller;
}

// 使用xib方法創建控制器
- (UIViewController *) createByXib
{
    UIViewController *controller = [[MyViewController alloc] initWithNibName:@"MyViewController" bundle:nil];
    
    return controller;
}

// 不指定xib方法創建控制器,默認會去尋找同名的xib文件
// xib優先級:MyView > MyViewController
// 默認會先找沒有後綴的
- (UIViewController *) createByNonSpecifyXib
{
    UIViewController *controller = [[MyViewController alloc] init];
    
    return controller;
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
