//
//  AppDelegate.m
//  DiDiSongYou
//
//  Created by Wayne on 5/11/16.
//  Copyright © 2016 GuoTang. All rights reserved.
//

#import "AppDelegate.h"
#import "UILoginViewController.h"
#import "Functions.h"
#import <BaiduMapAPI_Base/BMKMapManager.h>


@interface AppDelegate ()<BMKGeneralDelegate>

@end

@implementation AppDelegate{
    BMKMapManager *_mapManager;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _mapManager = [[BMKMapManager alloc]init];
    // 如果要关注网络及授权验证事件，请设定     generalDelegate参数
    BOOL ret = [_mapManager start:@"Dqlv7zmt8jjp5tXlU8SwS522oUKG4CzK"  generalDelegate:self];
    if (!ret) {
        NSLog(@"manager start failed!");
    }
    
    NSString *dvice_info = [[NSUserDefaults standardUserDefaults] stringForKey:@"dvice_info"];
    if( !dvice_info )
    {
        [[NSUserDefaults standardUserDefaults] setObject:[Functions uuid] forKey:@"dvice_info"];
    }
    
    UILoginViewController *loginVC = [[UILoginViewController alloc] init];
    self.window.rootViewController = loginVC;
    return YES;
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

- (void)onGetNetworkState:(int)iError
{
    NSLog(@"onGetNetworkState:%d", iError);
}

/**
 *返回授权验证错误
 *@param iError 错误号 : 为0时验证通过，具体参加BMKPermissionCheckResultCode
 */
- (void)onGetPermissionState:(int)iError
{
    NSLog(@"onGetPermissionState:%d", iError);
}
@end
