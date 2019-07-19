//
//  SceneViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: IBOutlets
    @IBOutlet weak var storyTextLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var choicesTableView: IntrinsicTableView!
    @IBOutlet weak var dynamicTVHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        choicesTableView.delegate = self
        choicesTableView.dataSource = self
        storyTextLabel.translatesAutoresizingMaskIntoConstraints = true
        // Do any additional setup after loading the view.
        Graph.shared.createStoryGraph()
        choices = Graph.shared.getChoices()!
        storyTextLabel.text = SceneController.shared.changeScene(sceneID: 1).readSceneFile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = min(self.view.bounds.size.height, choicesTableView.contentSize.height)
        dynamicTVHeight.constant = height
        self.storyTextLabel.sizeToFit()
        scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled = true
        self.view.layoutIfNeeded()
    }
    
    //MARK: Private Methods
    private func updateStoryText(scene: Scene) {
        storyTextLabel.text = scene.readSceneFile()
    }
    private func updateViews(scene: Scene) {
        updateStoryText(scene: scene)
        choicesTableView.reloadData()
    }
    
    //MARK: Public Variables
    
    
    //MARK: Private Variables
    private var choices: [Scene]?
    private var visited:[Int: Bool] = [:]

    ///MARK: IBActions
    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let choices = choices else {return}
        if let index = choicesTableView.indexPathForSelectedRow?.row {
            let scene = SceneController.shared.changeScene(sceneID: choices[index].unique_id)
            updateViews(scene: scene)
        } else {
            print(choices[0].unique_id)
        }
    }
        
//        if let index = choicesTableView.indexPathForSelectedRow?.row, let choices = choices {
//        let scene = SceneController.shared.changeScene(sceneID: choices[index].unique_id)
//        updateViews(scene: scene)
//        } else {
//            print
//        }
//    }
    //MARK: Tableview Delegate and Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let choices = choices else {return 0}
        return choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = choicesTableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        guard let choices = choices else {return cell}
        
        cell.imageView?.image = UIImage(named: "radioNotToggled")
        
        cell.textLabel?.text = choices[indexPath.row].getChoice()
        
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.imageView?.image = UIImage(named: "radioToggled")
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.imageView?.image = UIImage(named: "radioNotToggled")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
