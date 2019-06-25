//
//  Scene.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/24/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Scene {
    
    init(unique_id: Int, name: String, choice: Choice?) {
        self.unique_id = unique_id
        self.name = name
        self.choice = choice
    }
    let unique_id: Int
    let name: String
    let choice: Choice?
}
