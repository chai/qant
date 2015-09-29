//
//  BrandTableViewController.swift
//  qant
//
//  Created by Chai on 9/3/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit

class BrandTableViewController: UITableViewController {
    
    
    
    //MARK: Properties
    
    var brands = [Brand]()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

loadSampleBrand()
        
    }
    
    
    
    func loadSampleBrand(){
    
    let photo = UIImage(named:"defaultLogo")!
    let brand1 = Brand(name:"Mimco", description:"Mimco description", socialPoints:3, siteRating:1, logo: photo)!
        
        
        let brand2 = Brand(name:"Another not Mimco", description:"another Mimco description", socialPoints:1, siteRating:0, logo: photo)!
        
        
        brands+=[brand1, brand2]
    
        
    
    
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return brands.count
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "BrandTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BrandTableViewCell

        // Configure the cell...
        
        let brand = brands[indexPath.row]
        
        cell.nameLabel.text=brand.name
        cell.descriptionLabel.text=brand.description
        cell.ratingControl.clamsRating = brand.socialPoints! + brand.siteRating!
        cell.logoImage.image = brand.logo!
        
        
        

        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "showBrandDetail"{
            
//            let indexPath = tableView.indexPathForCell(selected)
 
            
            let brandDetailViewController = segue.destinationViewController as!BrandDetailViewController
            
            if let selectedBrandCell = sender as? BrandTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedBrandCell)!
                let selectedBrand = brands[indexPath.row]
                brandDetailViewController.brand = selectedBrand
                
                
            }
            
        }
        else
        {
            print ("hello", terminator: "")
        }
        
        
    }


}
