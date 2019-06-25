//
//  Choice.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Choice {
    
    init(requirement: Stat?, name: String){
        self.requirement = requirement
        self.name = name
    }
    let name: String
    let requirement: Stat?
}
