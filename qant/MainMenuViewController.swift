//
//  ViewController.swift
//  qant
//
//  Created by Chai on 9/2/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit

//Changed class from ViewController -> MainMenuViewController
class MainMenuViewController: UIViewController {

    
    //MARK: Action
    @IBOutlet weak var menuButton: UIBarButtonItem!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.menuButton.title = NSString(string: "\u{2630} Menu") as String
        if let font = UIFont(name: "Helvetica", size: 18.0) {
            self.menuButton.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

