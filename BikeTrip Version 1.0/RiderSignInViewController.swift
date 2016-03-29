//
//  RiderSignInViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 2/14/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit
import Firebase

class RiderSignInViewController: UIViewController {

    @IBOutlet weak var userEmailTextView: UITextField!
    @IBOutlet weak var userPasswordTextView: UITextField!
    let ref = Firebase(url: "http://bike-trip.firebaseapp.com")
    @IBOutlet weak var riderDriverSegment: UISegmentedControl!
    
    var isRider: Bool!
    //isRider =
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(title: String, message: String) {
        let myAlert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil)
        myAlert.addAction(okAction)
        self.presentViewController(myAlert, animated: true, completion: nil);
    }
  /*
    @IBAction func riderDriverSegment(sender: AnyObject) {
        
        if self.riderDriverSegment.selectedSegmentIndex == 0{
            
            self.isRider = true
            //is the rider
            
        }else {
            
            self.isRider = false
            //is a driver
        }
        
        
        
    }*/
    /*
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && CURRENT_USER.authData != nil
        {
            self.logoutButton.hidden = false
        }
    }
    
    */
    
    @IBAction func signInButtonTapped(sender: AnyObject) {
        
        let email = self.userEmailTextView.text
        let password = self.userPasswordTextView.text
        
        
        
        
        if email != "" && password != ""
        {
            self.ref.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error == nil
                {
                    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    print("Logged In :)")
                   // self.logoutButton.hidden = false
                }
                else
                {
                    //use the function of error
                    print(error)
                }
            })
        }
        else
        {
            displayMyAlertMessage("Error", message: "Enter your Email and Password")
        
        }


        
}
}
     /*
       
        var ref = Firebase(url: "https://docs-examples.firebaseio.com/web/saving-data/fireblog")
        let userEmail = userEmailTextView.text;
        let userPassword = userPasswordTextView.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if(userEmailStored == userEmail)// && (self.riderDriverSegment.selectedSegmentIndex != -1)
        {
            if(userPasswordStored == userPassword)
            {
                // Login is successfull
                NSUserDefaults.standardUserDefaults().setBool(true,forKey:"isUserLoggedIn");
                NSUserDefaults.standardUserDefaults().synchronize();
                
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            else
            {
                displayMyAlertMessage("Error", message: "Passwords do not match");
                return;
            }
        }
        else
        {
            displayMyAlertMessage("Invalid Email and password", message:  "Please register first if you haven't done so.");
            return;
        }
       

        


    }}*/