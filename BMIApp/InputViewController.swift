//
//  InputViewController.swift
//  BMIApp
//
//  Created by 早坂甫 on 2018/11/21.
//  Copyright © 2018年 早坂甫. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を変更（白）
        self.view.backgroundColor = UIColor.white
        
        
        // 体重入力欄の作成
        let weightLabel = UILabel()
        weightLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        weightLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        weightLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.4,
                                  width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        weightLabel.textAlignment = NSTextAlignment.left // 左寄せ
        weightLabel.text = "体重を入力" // タイトルを設定
        self.view.addSubview(weightLabel)
        
        let weightInputField = UITextField()
        weightInputField.keyboardType = UIKeyboardType.decimalPad
//        weightInputField.returnKeyType = UIReturnKeyType.default
        weightInputField.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.5,
                                        width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        weightInputField.textAlignment = NSTextAlignment.left // 左寄せ
        self.view.addSubview(weightInputField)
       
        /*
        let border = CALayer()
        var color = UIColor()
        border.backgroundColor = color.cgColor
        weightInputField.layer.addSublayer(border)
        */

        // 身長入力欄の作成
        let heightLabel = UILabel()
        heightLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        heightLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        heightLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.6,
                                   width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        heightLabel.textAlignment = NSTextAlignment.left // 左寄せ
        heightLabel.text = "身長を入力" // タイトルを設定
        self.view.addSubview(heightLabel)

        // BMI計算ボタンの生成
        let bmiCalcButton = UIButton()
        bmiCalcButton.backgroundColor = UIColor(named: "buttonPink")   // ボタンの色をピンク色（buttonPink）に設定
        bmiCalcButton.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.8,
                              width: view.frame.width * 0.5, height: view.frame.height * 0.1) // 横の位置を中央に設定
        bmiCalcButton.setTitleColor(UIColor(named: "textGray"), for: .normal) // ボタンの文字をグレー色（textGray）に設定
        bmiCalcButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        bmiCalcButton.layer.cornerRadius = 20 // ボタンに丸みを付ける
        bmiCalcButton.setTitle("計算", for: .normal)
        self.view.addSubview(bmiCalcButton)
        
        // BMI計算ボタンが押された時の処理を実行
        bmiCalcButton.addTarget(self, action: #selector(bmiCalcButtonClicked(sender:)), for:.touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    // BMI計算ボタンを押された時の処理
    @objc func bmiCalcButtonClicked(sender: UIButton){
        print("bmiCalcButtonClicked")
        let resultVC:ResultViewController = ResultViewController()
        self.navigationController?.pushViewController(resultVC, animated: true)
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
