//
//  scheduleViewController.swift
//  BikeTrip Version 1.0
//
//  Created by Sanjay Shrestha on 3/2/16.
//  Copyright © 2016 Sanjay Shrestha/ Rahul Murthy. All rights reserved.
//

import UIKit

class scheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var textLabel: UILabel!

   
    @IBOutlet weak var tableView: UITableView!
    var animalNames: [String] = ["Cat","Dog","Elephant","Gangaroo","Hipopotamos","Lion","Zebra"];

    override func viewDidLoad() {
        super.viewDidLoad()
       // datePicker.addTarget(self, action: Selector("dataPickerChanged:"), forControlEvents: UIControlEvents.ValueChanged)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitPressed(sender: AnyObject) {
    }

    func datePickerChanged(datePicker:UIDatePicker) {
        var dateFormatter = NSDateFormatter()
        
        dateFormatter.dateStyle = NSDateFormatterStyle.ShortStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        var strDate = dateFormatter.stringFromDate(datePicker.date)
        //dateLabel.text = strDate
    }
   
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animalNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        cell.textLabel!.text = animalNames[indexPath.row]
        //var image : UIImage = UIImage(named: animalImages[indexPath.row])!
        //cell.imageView.image = image
        return cell
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
