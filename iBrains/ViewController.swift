//
//  ViewController.swift
//  iBrains
//
//  Created by Ryan on 7/11/15.
//  Copyright (c) 2015 rlindskog. All rights reserved.
//

import UIKit

import SenseSdk
import Parse

class ViewController: UIViewController {
    
    //70 ft radius 37.376642, -121.921572
    var didSignup: Bool = false
   
    @IBOutlet var mainGameView: UIView!
    
    @IBAction func signupPressed(sender: UIButton) {
        signup()
    }
    
    func signup() {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user["infected"] = false
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                println(user.username)
                println(user.password)
                self.didSignup = true
                self.login()
                
            }
        }
    }
    
    @IBAction func loginPressed(sender: UIButton) {
        login()
    }
    
    
    func login(){
    PFUser.logInWithUsernameInBackground(usernameField.text, password: passwordField.text) {
    (user: PFUser?, error: NSError?) -> Void in
    if user != nil {
        println("Successful login")
        //Manual Trigger
        let errorPointer = SenseSdkErrorPointer.create()
        SenseSdkTestUtility.fireTrigger(
            fromRecipe: "Arrived in Room2",
            confidenceLevel: ConfidenceLevel.High,
            places: [AppDelegate.room],
            errorPtr: errorPointer
        )
        
        if errorPointer.error != nil {
            NSLog("Error sending trigger")
        }
        //End Trigger
        if self.didSignup {
            self.performSegueWithIdentifier("loginSegue", sender: self)
        }
            self.performSegueWithIdentifier("loginSegue", sender: self)
        
    } else {
    // The login failed. Check error to see why.
    }
    }
    }
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

