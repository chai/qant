//
//  Clam.swift
//  qant
//
//  Created by Chai on 9/3/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import UIKit

class Clam: UIView {

 
    //MARK: Properties
    
    
    var rating = 0
    var clamsButtons = [UIButton]()

    //set clams size to be relative to the frame
    
    
    //MARK: Initilisation
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        let filledClam = UIImage(named: "clam")
        let emptyClam = UIImage (named: "emptyClam")
        

       
        for _ in 0..<5 {
            let button = UIButton()
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: "clamButtonTapped:", forControlEvents: .TouchDown)
            clamsButtons += [button]
            addSubview(button)
        }
        
    }
    
    
    override func layoutSubviews() {
    
        let buttonSize = Int(frame.size.height)
        
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        
        // Offset each button's origin by the length of the button plus spacing.
        for (index, button) in clamsButtons.enumerate() {
            buttonFrame.origin.x = CGFloat(index * (buttonSize + 5))
            button.frame = buttonFrame
        }
        

    }
    
    
    //MARK: Button Action
    
    
    
    func clamButtonTapped(button: UIButton) {
        print("Button pressed 👍")
    }
    

    
    
    
    
    
    

}
