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
    
    
    var clamsRating = 0 {
    
        didSet {
            setNeedsLayout()
        }
        
    }
    
    var clamsButtons = [UIButton]()
    
    
    var buttonSpacing = 5
    var maximumClams=5
    
    
    

    //set clams size to be relative to the frame
    
    
    //MARK: Initilisation
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        let filledClam = UIImage(named: "clam")
        let emptyClam = UIImage (named: "emptyClam")
        

       
        for _ in 0..<maximumClams {
            let button = UIButton()
            button.setImage(emptyClam, forState: .Normal)
            button.setImage(filledClam, forState: .Selected)
            button.setImage(filledClam, forState: [.Highlighted, .Selected])
            
            //Ensure that button doesn't show additional hightlight during transistion of state
            button.adjustsImageWhenHighlighted = false
                
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
            buttonFrame.origin.x = CGFloat(index * (buttonSize + buttonSpacing))
            button.frame = buttonFrame
        }
        
        
        updateButtonSelectionStates()


    }
    
    
    //MARK: Button Action
    
    
    
    func clamButtonTapped(button: UIButton) {
        clamsRating = clamsButtons.indexOf(button)!+1
        updateButtonSelectionStates()
        
    }
    
    
    
    func updateButtonSelectionStates(){
        
        for (index, button) in clamsButtons.enumerate(){
        button.selected = index < clamsRating
        }
    }

    
    
    
    
    
    

}
