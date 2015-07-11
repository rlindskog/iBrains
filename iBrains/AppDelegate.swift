//
//  AppDelegate.swift
//  iBrains
//
//  Created by Ryan on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import UIKit
import SenseSdk

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Enabled the SDK with the application key provided by Sense360
        SenseSdk.enableSdkWithKey("<your application key>")
        
        // Fire when the user enters a restaurant
        let restaurantTrigger = FireTrigger.whenEntersPoi(.Restaurant)!
        
        // Recipe defines what trigger, what time of day and how long to wait between consecutive firings
        let restaurantRecipe = Recipe(name: "ArrivedAtRestaurant",
            trigger: restaurantTrigger,
            
            // Do NOT restrict the firing to a particular time of day
            timeWindow: TimeWindow.allDay,
            
            // Wait at least 1 hour between consecutive trigger firings.
            cooldown: Cooldown.create(oncePer: 1, frequency: CooldownTimeUnit.Hours)!)
        
        let callback = EnteredRestaurantCallback()
        
        // register the unique recipe and specify that when the trigger fires it should call our own "onTriggerFired" method below
        SenseSdk.register(recipe: restaurantRecipe, delegate: callback)
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

