//
//  AppDelegate.m
//  BBDropdownAmplification
//
//  Created by BiaoGe on 2016/11/26.
//  Copyright © 2016年 BiaoGe. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]];
    self.window.rootViewController=nav;
    [self.window makeKeyAndVisible];
    return YES;
}
@end
