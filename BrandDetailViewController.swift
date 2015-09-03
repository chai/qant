//
//  BrandDetailViewController.swift
//  qant
//
//  Created by Chai on 9/3/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit

class BrandDetailViewController: UIViewController {


  
    @IBOutlet weak var nameDescription: UILabel!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var clamRating: Clam!
    
    @IBOutlet weak var reviewTableView: UITableView!
    
    

    
    //MARK: Initilise 
    
    var brand = Brand()
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        
        
        if let brand = brand {
        
            
            navigationItem.title = brand.name
            nameDescription.text = brand.description
            
            
            
            
        }
    
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
