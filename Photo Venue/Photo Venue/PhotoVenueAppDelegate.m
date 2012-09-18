//
//  PhotoVenueAppDelegate.m
//  Photo Venue
//
//  Created by Carlos Folgar on 7/27/12.
//  Copyright (c) 2012 Carlos Folgar. All rights reserved.
//

#import "PhotoVenueAppDelegate.h"
#import "FlickrAPIKey.h"
#import "FlickrFetcher.h"

@implementation PhotoVenueAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    // Set-up the tab-bar controller that contains the "Places" and "Recent" controllers
//    UITabBarController *tabBarController = [[UITabBarController alloc] init];
//    PlacesViewController *placesController = [[PlacesViewController alloc] init];
//    RecentlyViewedViewController *recentPlacesController = [[RecentlyViewedViewController alloc]init];
//    
//    
//    // Create the two navigation controllers
//    UINavigationController *placesNavController = [[UINavigationController alloc] initWithRootViewController:placesController];
//    UINavigationController *recentsViewController = [[UINavigationController alloc] initWithRootViewController:recentPlacesController];
//    
//    // Finish setting up the tab-bar controlller
//    [tabBarController setViewControllers:[NSArray arrayWithObjects:placesNavController,recentsViewController, nil]];
//    
//    placesNavController.navigationItem.title = @"Trending Venues";
//    recentsViewController.navigationItem.title = @"Recently Viewed Photos";
//    
//    placesNavController.tabBarItem.title = @"Venues";
//    recentsViewController.tabBarItem.title = @"Recently Viewed";
//    
//    
//    // Make sure this tab bar controller is always the root view controller of this application
//    self.window.rootViewController = tabBarController;
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
