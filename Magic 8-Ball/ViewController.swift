//
//  ViewController.swift
//  Magic 8-Ball
//
//  Created by  on 9/13/19.
//  Copyright © 2019 oeldoronki80. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var circleButton = UIButton()
    var otherButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        circleButton.backgroundColor = UIColor.white
        
        circleButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/2, width: 30, height: 30))
        circleButton.layer.cornerRadius = 200
        circleButton.clipsToBounds = true
        circleButton.setTitle("8", for: .normal)
        self.view.addSubview(circleButton)
        otherButton.backgroundColor = UIColor.white
        
    }


}

