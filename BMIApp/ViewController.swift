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
        
        // 背景色を変更（白）
        self.view.backgroundColor = UIColor.white
        
        // タイトルの生成
        let titleLabel = UILabel()
        titleLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        titleLabel.font = UIFont.systemFont(ofSize: 10) // フォントサイズを変更
        titleLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.4,
                                  width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        titleLabel.textAlignment = NSTextAlignment.center // センター揃え
        // UILabelの縦はデフォルト中央に設置される。
//        titleLabel.backgroundColor = UIColor.red
        titleLabel.text = "BMI計算機" // タイトルを設定
        self.view.addSubview(titleLabel)
        
        // はじめるボタンの生成
        let button = UIButton()
        button.backgroundColor = UIColor(named: "buttonPink")   // ボタンの色をピンク色（buttonPink）に設定
        button.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.55,
                              width: view.frame.width * 0.5, height: view.frame.height * 0.1) // 横の位置を中央に設定
        button.setTitleColor(UIColor(named: "textGray"), for: .normal) // ボタンの文字をグレー色（textGray）に設定
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.layer.cornerRadius = 20 // ボタンに丸みを付ける
        button.setTitle("はじめる", for: .normal)
        self.view.addSubview(button)
        
        // ボタンが押された時の処理を実行
        button.addTarget(self, action: #selector(basicButtonClicked(sender:)), for:.touchUpInside)
        
        // memo
        // 1：何処の？（ViewController）　２：実行する関数　３：実行タイミング（ボタンを離した時に実行）
        // #selectorは決まった文で必ず必要
        //memo:navigationControllerを隠す。
        
    }
    // ボタンを押された時の処理
    @objc func basicButtonClicked(sender: UIButton){
        print("basicButtonBtnClicked")
        let secondVC:InputViewController = InputViewController()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }


}

