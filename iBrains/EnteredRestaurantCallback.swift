//
//  EnteredRestaurantCallback.swift
//  iBrains
//
//  Created by Ryan on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import Foundation
import SenseSdk

class EnteredRestaurantCallback: RecipeFiredDelegate {
    @objc func recipeFired(args: RecipeFiredArgs) {
    
        // Your user has entered a restaurant!
        
        NSLog("Recipe \(args.recipe.name) fired at \(args.timestamp).");
        for trigger in args.triggersFired {
            for place in trigger.places {
                NSLog(place.description)
            }
        }
    }
}