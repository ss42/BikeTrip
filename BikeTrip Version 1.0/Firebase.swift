//
//  Firebase.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 3/6/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import Foundation
import Firebase

let BASE_URL = "http://bike-trip.firebaseapp.com"

let FIREBASE_REF = Firebase(url: BASE_URL)

var CURRENT_USER: Firebase
{
    let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
    
    let currentUser = Firebase(url: "\(FIREBASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
    
    return currentUser!
}
