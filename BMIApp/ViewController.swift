//
//  ViewController.swift
//  BMIApp
//
//  Created by 早坂甫 on 2018/11/14.
//  Copyright © 2018年 早坂甫. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton()
        button.backgroundColor = UIColor.orange
        button.frame = CGRect(x: 40, y: 60, width: 100, height: 40)
        self.view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

