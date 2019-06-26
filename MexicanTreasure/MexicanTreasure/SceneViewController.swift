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
    
    
    
    
    
    //MARK: Private Methods
    
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
