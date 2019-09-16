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
    var resetButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        let circle = UIView(frame: CGRect(x: UIScreen.main.bounds.width/7.2, y: UIScreen.main.bounds.height/3, width: 300, height: 300))
        circle.backgroundColor = UIColor.clear
        circle.layer.borderWidth = 300
        circle.layer.borderColor = UIColor.white.cgColor
        circle.layer.cornerRadius = 300/2
        self.view.addSubview(circle)
        circleButton.backgroundColor = UIColor.white
        circleButton = UIButton(frame: CGRect(x: 60, y: 300, width: 300, height: 300))
        circleButton.setTitle("8", for: .normal)
        circleButton.setTitleColor(UIColor.black, for: .normal)
        circleButton.titleLabel?.font = UIFont.systemFont(ofSize: 90.0, weight: .bold)
        circleButton.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        self.view.addSubview(circleButton)
        
    
    }
    
    @objc func pressed (sender: UIButton!)
    {
        circleButton.isHidden = true
        resetButton.isHidden = false
        print("pressed")
    }


}

