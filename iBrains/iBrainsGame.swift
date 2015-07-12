//
//  iBrainsGame.swift
//  iBrains
//
//  Created by Mark Griffith on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import Foundation

import SenseSdk
import Parse



extension iBrainsGame{
	
    //user object
    
	func startGame(){
		println("Game Started")
        
	}
    
    
    func enteredRoom(myPlaceStr: String) {
        var user = PFUser.currentUser()!
        
        user["location"] = myPlaceStr
        println(user["location"])
        user.saveInBackgroundWithBlock {
            (success: Bool, error: NSError?) -> Void in
                if (success) {
                // The object has been saved.
                // Use Parse to find other players in same location and is infected
                    
                    var query : PFQuery = PFUser.query()!
                    query.whereKey("location", equalTo:"place")
                    query.findObjectsInBackgroundWithBlock {
                        (objects: [AnyObject]?, error: NSError?) -> Void in
                        
                        if error == nil {
                            // The find succeeded.
                            println("Successfully retrieved \(objects!.count) people in the area.")
                            // Do something with the found objects
                            if let objects = objects as? [PFObject] {
                                for object in objects {
                                    println(object.objectId)
                                }
                            }
                        } else {
                            // Log details of the failure
                            println("Error: \(error!) \(error!.userInfo!)")
                        }
                    }
                } else {
                // There was a problem, check error.description
                }
            }
        
        
        
        
    }
    
    
    
    
}



class iBrainsGame: NSObject {
    static let sharedInstance = iBrainsGame()
//    usage: iBrainsGame.sharedInstance
    
    
}