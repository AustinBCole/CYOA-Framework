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
    
    ///This array contains the name of each scene's file, in order.
    private let sceneFileArray: Array = ["1opening", "2robber", "3pizza", "4defend", "5theft", "6friend", "7mexico", "8flee", "9fly", "10robber_together_get_it", "11robber_scout", "12robber_alone", "13alone_without_robber", "14friend_together", "15friend_scout"]
    
    
    ///This dictionary contains the choice text for each scene. The key is the scene number and the value is the choice text.
    private let sceneChoiceDictionary: [Int: String] = [1: "", 2: "", 3: "Eat some pizza", 4: "Shoot the robber", 5: "Hide", 6: "Recruit your archeologist friend.", 7: "Search the internet and go it alone.", 8: "Spring robber from jail and go with him to find the treasure.", 9: "", 10: "Go get it!", 11: "Lie low for a bit to scout out dangers.", 12: "Let him go get it alone and bring it back.", 13: "You go get it alone and bring it back", 14: "Go get it!", 15: "Lie low for a bit to scout out dangers."]
    
    ///This dictionary contains stat requirements for the player. The key is the scene number, the value is the stat followed by the requirement.
    private let choiceRequirementTuplesDictionary: [Int: (String, Int)] = [8: ("Guts", 10)]
    
    
    
    //MARK: Pubic Methods
    
    //MARK: Internal Methods
    
    internal func getSceneArray() -> Array<Scene> {
        createScenes()
        return sceneArray
    }
    internal func createScenes() {
        var count = 1
        for sceneFile in sceneFileArray {
            print(count)
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
        for scene in sceneArray {
            print(scene.unique_id)
            print(scene.choice?.name)
        }
    }
    //MARK: Private Methods
    ///This method will return the scene associated with the selected button's choice text. Enter the tag of the button here and the appropriate scene will be returned.
    private func getScene(tag: Int) -> Scene {
        return sceneArray[tag - 1]
    }
    
}
