//
//  Graph.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/26/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import Foundation

class Graph {
    
    //MARK: Singleton
    static let shared = Graph()
    private init(){}
    
    private var sceneVertices: [Scene: [Scene]] = [:]
    
    private let adjacencyDictionary: Dictionary = [1: [2], 2: [3, 4, 5], 3: [], 4: [6, 7], 5: [8, 6, 7], 6: [9], 7: [], 8: [11, 12, 13], 9: [14, 15], 10: [], 11: [], 12: [], 13: [], 14: [], 15: []]
    
    internal func createStoryGraph() {
        
        // Get the array of scenes in reversed order
        let sceneArray = SceneController.shared.getSceneArray()
        // Iterate over scenes
        for scene in sceneArray {
        // Add each scene as a vertex
            print(scene.name)
            addSceneVertex(vertex: scene)
        // Get connected vertices, which will be ints
        // Add edges be vertex by getting the using vertex - 1 of the sceneArray
            if adjacencyDictionary[scene.unique_id]!.count > 0 {
                for vertex in adjacencyDictionary[scene.unique_id]! {
                    addEdge(vertex: scene, edgeVertex: sceneArray[vertex - 1])
                }
            }
        }
    }
    private func addSceneVertex(vertex: Scene) {
        self.sceneVertices[vertex] = []
    }
    private func addEdge(vertex: Scene, edgeVertex: Scene) {
        self.sceneVertices[vertex]?.append(edgeVertex)
    }
}
