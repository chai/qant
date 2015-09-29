//
//  util.swift
//  qant
//
//  Created by Chai on 9/7/15.
//  Copyright © 2015 Chai. All rights reserved.
//

import Foundation
//Global function to make it easier to change log inmplementation later

func write_log(object: Any){//, function: String = __FUNCTION__) {
    #if DEBUG
        Swift.print("\(object)", terminator: "")
    #endif
}