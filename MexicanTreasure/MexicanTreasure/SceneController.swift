//
//  SceneController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/24/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation
class SceneController {
    
    //Singleton
    static let shared = SceneController()
    private init(){}
    
    //MARK: Public Properties
    
    
    
    //MARK: Private Properties
    private var sceneArray: Array<Scene> = []
    
    private let sceneFileArray: Array = ["1opening", "2robber", "3pizza", "4defend", "5theft", "6friend", "7mexico", "8flee", "9fly_alone", "10robber_together_get_it", "11robber_scout", "12robber_alone", "13alone_without_robber", "14friend_together", "15friend_scout"]
    
    private let sceneChoiceDictionary: [Int: String] = [1: "", 2: "Robber", 3: "Eat some pizza", 4: "Shoot the robber", 5: "Hide", 6: "Recruit your archeologist friend.", 7: "Search the internet and go it alone.", 8: "Spring robber from jail and go with him to find the treasure.", 9: "", 10: "Go get it!", 11: "Lie low for a bit to scout out dangers.", 12: "Let him go get it alone and bring it back.", 13: "You go get it alone and bring it back", 14: "Go get it!", 15: "Lie low for a bit to scout out dangers."]
    
    private let choiceRequirementTuplesDictionary: [Int: (String, Int)] = [8: ("Guts", 10)]
    
    private let adjacencyDictionary: Dictionary = [1: [2], 2: [3, 4, 5], 3: [], 4: [6, 7], 5: [8, 6, 7], 6: [9], 7: [], 8: [11, 12, 13], 9: [14, 15], 10: [], 11: [], 12: [], 13: [], 14: [], 15: []]
    
    
    
    //MARK: Pubic Methods
    public func createScenes() {
        var count = 1
        for sceneFile in sceneFileArray {
            if sceneChoiceDictionary[count] != "" {
                if (choiceRequirementTuplesDictionary[count] != nil) {
                    let scene = Scene(unique_id: count, name: sceneFile, choice: Choice(requirement: Stat(withTuple: choiceRequirementTuplesDictionary[count]!), name: sceneChoiceDictionary[count]!))
                    sceneArray.append(scene)
                }
                let scene = Scene(unique_id: count, name: sceneFile, choice: Choice(requirement: nil, name: sceneChoiceDictionary[count]!))
                sceneArray.append(scene)
            }
            else {
                let scene = Scene(unique_id: count, name: sceneFile, choice: nil)
                sceneArray.append(scene)
            }
            count += 1
        }
    }
    
    //MARK: Internal Methods
    
    
    //MARK: Private Methods
    private func getScene(tag: Int) -> Scene {
        return sceneArray[tag - 1]
    }
    private func getSceneChoices(currentScene: Scene) {
        let choicesArray: Array<Choice> = []
        if adjacencyDictionary[currentScene.unique_id]?.count != 0 {
            for uniqueID in adjacencyDictionary[currentScene.unique_id]! {
                for scene in sceneArray[tag - 1:]
            }
        }
    }
}
