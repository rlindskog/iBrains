//
//  ViewController.swift
//  iBrains
//
//  Created by Ryan on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import UIKit

import SenseSdk


class ViewController: UIViewController {
    //70 ft radius 37.376642, -121.921572
    
    func enteredRoom() {
        let errorPointer = SenseSdkErrorPointer.create()
        // This method should only be used for testing
        SenseSdkTestUtility.fireTrigger(
            fromRecipe: "Arrived in Room2",
            confidenceLevel: ConfidenceLevel.Medium,
            places: [AppDelegate.room],
            errorPtr: errorPointer
        )
        
        if errorPointer.error != nil {
            NSLog("Error sending trigger")
        }
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.enteredRoom()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

