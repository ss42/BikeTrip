//
//  RiderSignInViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 2/14/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit

class RiderSignInViewController: UIViewController {

    @IBOutlet weak var userEmailTextView: UITextField!
    @IBOutlet weak var userPasswordTextView: UITextField!
    
    @IBOutlet weak var riderDriverSegment: UISegmentedControl!
    
    var isRider: Bool!
    
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
    
    @IBAction func riderDriverSegment(sender: AnyObject) {
        
        if self.riderDriverSegment.selectedSegmentIndex == 0{
            
            self.isRider = true
            
        }else {
            
            self.isRider = false
            //is a driver
        }
        
        
        
    }
    @IBAction func signInButtonTapped(sender: AnyObject) {
        let userEmail = userEmailTextView.text;
        let userPassword = userPasswordTextView.text;
        
        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
        
        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
        
        if(userEmailStored == userEmail) && (self.riderDriverSegment.selectedSegmentIndex != -1)
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
       
        
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
