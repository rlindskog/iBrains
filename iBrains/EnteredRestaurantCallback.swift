//
//  EnteredRestaurantCallback.swift
//  iBrains
//
//  Created by Ryan on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import Foundation
import SenseSdk
import Parse

class EnteredRestaurantCallback: RecipeFiredDelegate {
    @objc func recipeFired(args: RecipeFiredArgs) {
    
        // Your user has entered a restaurant!
        
        NSLog("Recipe \(args.recipe.name) fired at \(args.timestamp).");
        for trigger in args.triggersFired {
            for place in trigger.places {
                NSLog(place.description)
                
                //post to parse
                let myPlace = place as! CustomGeofence
                
                var user = PFUser()
                user["username"] = "Ryan Lindskog"
                user["infected"] = false
                user["location"] = "\(myPlace)"
                user.saveInBackgroundWithBlock {
                    (success: Bool, error: NSError?) -> Void in
                    if (success) {
                        // The object has been saved.
                    } else {
                        // There was a problem, check error.description
                    }
                }
                
                println(myPlace)
                
//                println(myPlace.name)
//                println(myPlace.location)
                
            }
        }
    }
}