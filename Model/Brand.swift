//
//  Reputation.swift
//  qant
//
//  Created by Chai on 9/3/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import Foundation
import UIKit


class Brand {

    //MARK: Properties
    
    var name : String
    var description: String
    var socialPoints: Int?
    var siteRating: Int?
    var logo : UIImage?
    
  
    
    //MARK: Initisalised
    
    init? (name: String, description:String, socialPoints:Int?, siteRating:Int?, logo:UIImage?){
     
        self.name=name
        self.description=description
        self.socialPoints=socialPoints
        self.siteRating=siteRating
        self.logo=logo
        
    }
    
    
    
    

}