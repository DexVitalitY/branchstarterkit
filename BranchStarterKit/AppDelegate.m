//
//  AppDelegate.m
//  BranchStarterKit
//
//  Created by Derrick Staten on 8/1/15.
//  Copyright (c) 2015 Derrick Staten. All rights reserved.
//

#import "AppDelegate.h"
#import "Branch.h" // Step 1 of 3

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // Step 2 of 3
    [[Branch getInstance] initSessionWithLaunchOptions:launchOptions andRegisterDeepLinkHandler:^(NSDictionary *params, NSError *error) {
        if (!error) NSLog(@"Branch returned params: %@", params);
    }];
    
    return YES;
}

// Step 3 of 3
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[Branch getInstance] handleDeepLink:url];
}

@end
