//
//  SceneViewController.swift
//  MexicanTreasure
//
//  Created by Austin Cole on 6/25/19.
//  Copyright © 2019 Austin Cole. All rights reserved.
//

import UIKit

class SceneViewController: UIViewController {

    @IBOutlet private weak var buttonsView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        // Do any additional setup after loading the view.
    }
    
    //MARK: Public Variables
    
    
    //MARK: Private Variables
    
    private func createButton() {
        let button = UIButton(frame: CGRect(x: 8, y: 8, width: buttonsView.frame.width - 16, height: 50))
        button.setTitle("This is a test to see if a really long title will wrap or soemthing, I don't know", for: .normal)
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.backgroundColor = .black
        buttonsView.addSubview(button)
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
