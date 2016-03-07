//
//  scheduleViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 3/2/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit

class scheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
 
    @IBOutlet weak var scheduleTableView: UITableView!
    
    //var objects: NSMutableArray! = NSMutableArray()
    
    
    
    var animalNames: [String] = ["Cat","Dog","Elephant","Gangaroo","Hipopotamos","Lion","Zebra"];

    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
        //self.scheduleTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        
        return animalNames.count
    }
    
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let myCell  = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "myCell")
        //let myCell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as! TableViewCell
        myCell.textLabel!.text = animalNames[indexPath.row]
        //myCell.titleLabel!.text = self.objects[0]
       
        
        
        //myCell.testButton.tag = indexPath.row   //testbutton needs to be renamed
        //myCell.testButton.addTarget(self, action: "logAction", forControlEvents: .TouchUpInside)
        
        //myCell.textLabel!.textColor = UIColor.darkTextColor()
        return myCell
    }
    
    func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetailSegue", sender: self)
    }
    

    

    
    
    @IBAction func submitPressed(sender: AnyObject) {
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
