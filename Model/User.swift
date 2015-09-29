//
//  User.swift
//  qant
//
//  Created by Chai on 9/4/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import Foundation
import UIKit


class User{
    
    //MARK: Properties
    
    var displayName : String
    var emailAddress: String
    var siteReputation: Int
    var userAvatar : UIImage

    
    
    //MARK: Initisalised
    
    init? (displayName: String, emailAddress: String, siteReputation:Int, userAvatar:UIImage){
        
        self.displayName=displayName
        self.emailAddress=emailAddress
        self.siteReputation=siteReputation
        self.userAvatar=userAvatar
        
        if displayName.isEmpty || emailAddress.isEmpty{
            return nil
        }
        
    }
    
    init? ()
    {        self.displayName="displayName"
        
        self.emailAddress="default@email.ccc"
        self.siteReputation=0
        self.userAvatar = UIImage(named : "defaultAvatar")!
        
    }
    
    
}