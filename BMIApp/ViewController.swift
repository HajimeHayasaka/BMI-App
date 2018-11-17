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
        button.backgroundColor = UIColor(red: 1.0, green: 0.7, blue: 0.7, alpha:1.0)
        button.frame = CGRect(x: 100, y: 350, width: 100, height: 40)
        button.setTitle("はじめる", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.layer.cornerRadius = 10
        self.view.addSubview(button)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor.gray
        titleLabel.text = "BMI計算機"
        titleLabel.frame = CGRect(x: 100, y: 250, width: 100, height: 40)
        self.view.addSubview(titleLabel)
        
        
//        button.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        // Do any additional setup after loading the view, typically from a nib.
    }


}

