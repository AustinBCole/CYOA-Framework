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
    
    internal func readSceneFile() -> String {
        let file = "\(self.name).txt"
        var text = ""
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let fileURL = dir.appendingPathComponent(file)
            do {
                text = try String(contentsOf: fileURL, encoding: .utf8)
            }
            catch {
                fatalError("Stuff went wrong in SceneController.readSceneFile: \(error)")
            }
        }
        return text
    }
}
