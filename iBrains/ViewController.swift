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
    
    @IBAction func signupPressed(sender: UIButton) {
        signup()
    }
    
    func signup() {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackgroundWithBlock {
            (succeeded: Bool, error: NSError?) -> Void in
            if let error = error {
                let errorString = error.userInfo?["error"] as? NSString
                // Show the errorString somewhere and let the user try again.
            } else {
                // Hooray! Let them use the app now.
            }
        }
    }
    
    
    func login(){
    PFUser.logInWithUsernameInBackground("myname", password:"mypass") {
    (user: PFUser?, error: NSError?) -> Void in
    if user != nil {
    // Do stuff after successful login.
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

