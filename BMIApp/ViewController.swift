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
        
        self.view.backgroundColor = UIColor.white
        
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonPink")
        button.frame = CGRect(x: view.frame.width * 0.1, y: 350, width: view.frame.width * 0.8, height: 40)
        button.setTitle("はじめる", for: .normal)
        button.setTitleColor(UIColor(named: "textGray"), for: .normal)
        button.layer.cornerRadius = 10
        self.view.addSubview(button)
        
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(named: "textGray")
        titleLabel.text = "BMI計算機"
        titleLabel.frame = CGRect(x: 100, y: 250, width: 100, height: 40)
        self.view.addSubview(titleLabel)
        
        
        button.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        // 1：何処の？（ViewController）　２：実行する関数　３：実行タイミング（ボタンを離した時に実行）
        // #selectorは決まった文で必ず必要
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //memo:navigationControllerを隠す。
        
    }
    @objc func basicButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        let secondVC:InputViewController = InputViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

