//
//  Scene.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/24/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Scene: Equatable, Hashable {
    static func == (lhs: Scene, rhs: Scene) -> Bool {
        return lhs.unique_id == rhs.unique_id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.unique_id)
    }
    init(unique_id: Int, name: String, choice: Choice?) {
        self.unique_id = unique_id
        self.name = name
        self.choice = choice
    }
    let unique_id: Int
    let name: String
    let choice: Choice?
    
    internal func readSceneFile() -> String {
        let file = self.name
        let path = Bundle.main.path(forResource: file, ofType: "txt")
        let text: String
        do {
            text = try String(contentsOfFile: path!, encoding: .utf8)
        } catch {
            fatalError()
        }
        return text
    }
    internal func getChoice() -> String? {
        if choice?.name == "" || choice?.name == nil{
            return nil
        }
        return choice!.name
    }
}
