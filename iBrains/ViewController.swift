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
    func customLocation() {
        let room = CustomGeofence(latitude: 37.376642, longitude: -121.921572, radius: 23, customIdentifier: "iosDevCamp room")
        let geofenceTrigger: Trigger? = FireTrigger.whenEntersGeofences([room])
    }
    
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.customLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

