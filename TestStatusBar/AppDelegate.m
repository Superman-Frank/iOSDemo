//
//  AppDelegate.m
//  TestStatusBar
//
//  Created by nongbaoling on 2020/4/10.
//  Copyright © 2020 Frank. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
//3DTouchEvent
#define ifree3DTouchShare @"com.iApp.3DTouth.share"
#define ifree3DTouchMogos @"com.iApp.3DTouth.mogos"
#define ifree3DTouchStore @"com.iApp.3DTouth.store"
#define ifree3DTouchTopup @"com.iApp.3DTouth.topUp"
#define ifree3DTouchiVoice @"com.iApp.3DTouth.iVoice"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ViewController * vc = [[ViewController alloc]init];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:vc];
    self.window.rootViewController = nav;
    #if DEBUG
        // iOS
        [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/iOSInjection.bundle"] load];
        // tvOS
        //    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/tvOSInjection.bundle"] load];
        // macOS
        //    [[NSBundle bundleWithPath:@"/Applications/InjectionIII.app/Contents/Resources/macOSInjection.bundle"] load];
    #endif
    [self.window makeKeyWindow];
    return YES;
}

//---- 3D Touch
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler
{
  NSLog(@"name:%@\ntype:%@", shortcutItem.localizedTitle, shortcutItem.type);
}

@end
