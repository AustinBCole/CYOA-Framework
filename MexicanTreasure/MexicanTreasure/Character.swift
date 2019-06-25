//
//  Player.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Character {
    
    init(name: String, maxHealthPoints: Int, healthPoints: Int, stats: Array<Stat>){
        self.name = name
        self.maxHealthPoints = maxHealthPoints
        self.healthPoints = healthPoints
        self.stats = stats
    }
    let name: String
    var maxHealthPoints: Int
    var healthPoints: Int
    let stats: Array<Stat>
}

class Player: Character {
    
    init(name: String, maxHealthPoints: Int, healthPoints: Int, stats: Array<Stat>, inventory: Array<Item>) {
        self.inventory = inventory
        super.init(name: name, maxHealthPoints: maxHealthPoints, healthPoints: healthPoints, stats: stats)
    }
    var inventory: Array<Item>
}

class Enemy: Character {
    
    init(name: String, maxHealthPoints: Int, healthPoints: Int, stats: Array<Stat>, loot: Array<Item>) {
        self.loot = loot
        super.init(name: name, maxHealthPoints: maxHealthPoints, healthPoints: healthPoints, stats: stats)
    }
    var loot: Array<Item>
}
