//
//  registerViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 3/2/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit
import Firebase

class registerViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var passwordTextView: UITextField!
    
    @IBOutlet weak var repeatPasswordTextView: UITextField!
    
    let ref = Firebase(url: "http://bike-trip.firebaseapp.com")

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func registerButtonTapped(sender: AnyObject) {
        let email  =  userEmailTextField.text
        let password   = passwordTextView.text
        let repeatPassword = repeatPasswordTextView.text
        
        
        if email   != "" && password != "" && repeatPassword != ""
        {
            
            if password == repeatPassword{
                
                self.ref.createUser(email, password: password, withValueCompletionBlock: { (error, authData) -> Void in
                    
                    if error == nil
                    {
                        self.ref.authUser(email, password: password, withCompletionBlock: { error, authData in
                            
                            if error == nil
                            {
                                NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                                NSUserDefaults.standardUserDefaults().synchronize()
                                print("Account Created :)")
                                self.dismissViewControllerAnimated(true,completion: nil)
                            }
                            else
                            {
                                print(error)
                            }
                        
                        
                        })
                    }
                    
                    })
            }else{
                
                displayMyAlertMessage("Error", message: "Password doesn't match.")
                
            }
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Enter Email and Password.", preferredStyle: UIAlertControllerStyle.Alert)
            let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
            alert.addAction(action)
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
}
        /*
        //check for empty fields
        if (userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty)
        {
            //Display alert message
            displayMyAlertMessage("Error", message: "All fields are requrired")
            return;
        }
        if (userPassword != userRepeatPassword){
            //Display an alert
            displayMyAlertMessage("Error", message: "Passwords do not match")
        }
        //store data
        //Need to Store data in ServerSide
        NSUserDefaults.standardUserDefaults().setObject(userEmail, forKey: "userEmail")
        NSUserDefaults.standardUserDefaults().setObject(userPassword, forKey: "userPassword")
        NSUserDefaults.standardUserDefaults().synchronize();
        
        //display alert message with confirmation
     
            
            let myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated:true, completion:nil);
            
        }
    
    }
    


*/