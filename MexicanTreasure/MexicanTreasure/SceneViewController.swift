//
//  SceneViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var storyTextLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var choicesTableView: IntrinsicTableView!
    @IBOutlet weak var dynamicTVHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        choicesTableView.delegate = self
        choicesTableView.dataSource = self
        storyTextLabel.translatesAutoresizingMaskIntoConstraints = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = min(self.view.bounds.size.height, choicesTableView.contentSize.height)
        dynamicTVHeight.constant = height
        print(height)
        print(choicesTableView.frame.height)
        self.storyTextLabel.sizeToFit()
        scrollView.setContentOffset(CGPoint(x: 0, y: self.scrollView.contentOffset.y), animated: true)
        self.scrollView.isDirectionalLockEnabled = true
        self.view.layoutIfNeeded()
    }
    
    //MARK: Public Variables
    
    
    //MARK: Private Variables

    //MARK: Tableview Delegate and Data Source Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = choicesTableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.imageView?.image = UIImage(named: "radioNotToggled")
        cell.textLabel?.text = "This is a test choice. Let's see if it word wraps appropriately."
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.numberOfLines = 0
        
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
