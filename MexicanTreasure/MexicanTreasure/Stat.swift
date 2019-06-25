//
//  STat.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Stat {
    
    init(withTuple: (String, Int)){
        self.name = tuple.0
        self.value = tuple.1
    }
    
    let name: String
    var value: Int
}
