//
//  ViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 2/14/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var destinationInfoButton: UIButton!
    @IBOutlet weak var viewUpcomingTripsButton: UIButton!
    let ref = Firebase(url: "https://bike-trip.firebaseio.com")

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool)
    {
    let isUserLoggedIn = NSUserDefaults.standardUserDefaults().boolForKey("isUserLoggedIn");
        
        if(!isUserLoggedIn)
        {
            self.performSegueWithIdentifier("loginView", sender: self);
            print("helloworld")
        }
        
        
    }

    @IBAction func destinationInfoButtonPressed(sender: UIButton) {
        
        
    }
    @IBAction func viewUpcomingTripsButtonPressed(sender: UIButton) {
        
    }
    
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
        NSUserDefaults.standardUserDefaults().setBool(false,forKey:"isUserLoggedIn");
        NSUserDefaults.standardUserDefaults().synchronize();
        
        self.performSegueWithIdentifier("loginView", sender: self);
        
        
    }
        
    }
