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
	
	func startGame(){
		println("Game Started")
        enteredRoom()
        
        
	}
    
    
    func enteredRoom() {
        let errorPointer = SenseSdkErrorPointer.create()
        // This method should only be used for testing
        
        SenseSdkTestUtility.fireTrigger(
            fromRecipe: "Arrived in Room2",
            confidenceLevel: ConfidenceLevel.High,
            places: [AppDelegate.room],
            errorPtr: errorPointer
        )
        
        if errorPointer.error != nil {
            NSLog("Error sending trigger")
        }
    }
    
    
}

class iBrainsGame: NSObject {
    
    
}