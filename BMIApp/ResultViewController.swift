//
//  ResultViewController.swift
//  BMIApp
//
//  Created by 早坂甫 on 2018/11/26.
//  Copyright © 2018年 早坂甫. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を変更（白）
        self.view.backgroundColor = UIColor.white

        // 結果の表示
        let bmiLabel = UILabel()
        bmiLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        bmiLabel.font = UIFont.systemFont(ofSize: 30) // フォントサイズを変更
        bmiLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.2,
                                width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        bmiLabel.textAlignment = NSTextAlignment.center // 中央揃え
        bmiLabel.text = "BMI" // タイトルを設定
        self.view.addSubview(bmiLabel)
        
        // 閉じるボタンの生成
        let closeButton = UIButton()
        closeButton.backgroundColor = UIColor(named: "buttonPink")   // ボタンの色をピンク色（buttonPink）に設定
        closeButton.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.8,
                                     width: view.frame.width * 0.5, height: view.frame.height * 0.1) // 横の位置を中央に設定
        closeButton.setTitleColor(UIColor(named: "textGray"), for: .normal) // ボタンの文字をグレー色（textGray）に設定
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        closeButton.layer.cornerRadius = 20 // ボタンに丸みを付ける
        closeButton.setTitle("閉じる", for: .normal)
        self.view.addSubview(closeButton)
        
        // BMI計算ボタンが押された時の処理を実行
        closeButton.addTarget(self, action: #selector(closeButtonClicked(sender:)), for:.touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    // BMI計算ボタンを押された時の処理
    @objc func closeButtonClicked(sender: UIButton){
        print("closeButtonClicked")
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