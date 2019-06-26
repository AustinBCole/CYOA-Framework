//
//  SceneViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: Public Variables
    
    
    //MARK: Private Variables
    
    
    //MARK: Public Methods
    
    public func createScene(text: String, font: UIFont = UIFont(name: "Helvetica", size: 20)!) {
        let height = getHeightForLabel(text: text, font: font)
        createLabel(height: height, text: text, font: font)
    }
    
    //MARK: Private Methods
    
    private func createLabel(height: CGFloat, text: String, font: UIFont) {
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: view.frame.width - 16, height: height))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        view.addSubview(label)
    }
    
    private func getHeightForLabel(text: String, font: UIFont) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 8, y: 8, width: view.frame.width - 16, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        
        label.sizeToFit()
        
        return label.frame.height
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
