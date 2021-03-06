//
//  InputViewController.swift
//  BMIApp
//
//  Created by 早坂甫 on 2018/11/21.
//  Copyright © 2018年 早坂甫. All rights reserved.
//

import UIKit

class InputViewController: UIViewController, UITextFieldDelegate {

    let weightInputField = UITextField()
    let heightInputField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を変更（白）
        self.view.backgroundColor = UIColor.white

        // デリゲートを設定
        weightInputField.delegate = self
        heightInputField.delegate = self
        
        // クリアボタンの設定
        weightInputField.clearButtonMode = .whileEditing // UITextField.ViewMode.whileEditingの省略形
        heightInputField.clearButtonMode = .whileEditing // 同上

        // MARK:完了ボタンの作成
        let kbToolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 40))
        kbToolBar.barStyle = UIBarStyle.default  // スタイルを設定
        kbToolBar.sizeToFit()  // 画面幅に合わせてサイズを変更

        let spacer = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil)
        let commitButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(commitButtonTapped(sender:)))
        kbToolBar.items = [spacer, commitButton]

        
        // MARK:体重入力欄の作成
        // 体重入力タイトル表示
        let weightLabel = UILabel()
        weightLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        weightLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        weightLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.2,
                                  width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        weightLabel.textAlignment = NSTextAlignment.left // 左寄せ
        weightLabel.text = "体重を入力" // タイトルを設定
        self.view.addSubview(weightLabel)

        // 体重入力の単位表示
        let weightUnitLabel = UILabel()
        weightUnitLabel.textColor = UIColor(named:"textGray") // ボタンの色をグレー色（textGray）に設定
        weightUnitLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        weightUnitLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.25,
                                   width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        weightUnitLabel.textAlignment = NSTextAlignment.right // 右寄せ
        weightUnitLabel.text = "Kg"
        self.view.addSubview(weightUnitLabel)
        
        // 体重入力欄の作成
        weightInputField.keyboardType = UIKeyboardType.decimalPad // キーボードのタイプを設定　※数字と小数点のみ「decimalPad」
        weightInputField.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.25,
                                        width: view.frame.width * 0.7, height: view.frame.height * 0.1) // 表示位置を設定
        weightInputField.textAlignment = NSTextAlignment.left // 左寄せ
        weightInputField.placeholder = "体重を入力" // 未入力の場合の表示文字を設定
        weightInputField.inputAccessoryView = kbToolBar // 完了ボタンをセット
        self.view.addSubview(weightInputField)
        
        // 下線を表示（体重入力欄）
        let underLineOfweight =  UIView()
        underLineOfweight.backgroundColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        underLineOfweight.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.32,
                                 width: view.frame.width * 0.8, height: 1.0) // 表示位置を設定
        self.view.addSubview(underLineOfweight)

        
        // MARK:身長入力欄の作成
       // 身長入力タイトル表示
        let heightLabel = UILabel()
        heightLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        heightLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        heightLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.35,
                                   width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        heightLabel.textAlignment = NSTextAlignment.left // 左寄せ
        heightLabel.text = "身長を入力" // タイトルを設定
        self.view.addSubview(heightLabel)

        // 身長入力の単位表示
        let heightUnitLabel = UILabel()
        heightUnitLabel.textColor = UIColor(named:"textGray") // ボタンの色をグレー色（textGray）に設定
        heightUnitLabel.font = UIFont.systemFont(ofSize: 20) // フォントサイズを変更
        heightUnitLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.4,
                                       width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        heightUnitLabel.textAlignment = NSTextAlignment.right // 右寄せ
        heightUnitLabel.text = "cm"
        self.view.addSubview(heightUnitLabel)
        
        // 身長入力欄の作成
        heightInputField.keyboardType = UIKeyboardType.decimalPad // キーボードのタイプを設定　※数字と小数点のみ「decimalPad」
        heightInputField.returnKeyType = .done
        heightInputField.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.4,
                                        width: view.frame.width * 0.7, height: view.frame.height * 0.1) // 表示位置を設定
        heightInputField.textAlignment = NSTextAlignment.left // 左寄せ
        heightInputField.placeholder = "身長を入力" // 未入力の場合の表示文字を設定
        heightInputField.inputAccessoryView = kbToolBar // 完了ボタンをセット
        self.view.addSubview(heightInputField)
        
        // 下線を表示（身長入力欄）
        let underLineOfheight =  UIView()
        underLineOfheight.backgroundColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        underLineOfheight.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.47,
                                         width: view.frame.width * 0.8, height: 1.0) // 表示位置を設定
        self.view.addSubview(underLineOfheight)

        
        // MARK:BMI計算ボタンの生成
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

    }
    
    // BMI計算ボタンを押された時の処理
    @objc func bmiCalcButtonClicked(sender: UIButton){ // objc = Objective-C の関数。
        // MARK:BMI計算ボタンを押された時の処理
        // memo 空文字で判定する場合はweightInputField.text?.isEmptyが使える。
        if let weight = Double(weightInputField.text!), let height = Double(heightInputField.text!) {
            let calcBMIResultValue = calcBMI(weight: weight, height: height)
            let resultVC: ResultViewController = ResultViewController(calcBMIResultValue: calcBMIResultValue)
            self.present(resultVC, animated: true) // 下からニュッと出る。モーダル遷移。
            print("Numeric")
        } else {
            let alert: UIAlertController = UIAlertController(title: "エラー", message: "数字入れてください", preferredStyle:  UIAlertController.Style.alert)
            let cancelAction: UIAlertAction = UIAlertAction(title: "閉じる", style: UIAlertAction.Style.cancel, handler:nil)
            alert.addAction(cancelAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    // 改行ボタンを押された場合の処理
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // MARK:改行ボタンを押された場合の処理
        if weightInputField.text != "" {
            print("wValue:\(Double(weightInputField.text!)!)")
        }
        if heightInputField.text != "" {
            print("hValue:\(Double(heightInputField.text!)!)")
        }
        textField.resignFirstResponder()
        return true
    }
    
    // BMI計算処理
    func calcBMI(weight: Double, height: Double) -> Double {
        return round((weight / ((height / 100.0) * (height / 100.0))) * 10) / 10 // 小数点1位以下四捨五入
    }
    
    // 完了ボタンをタッチした場合にキーボードを閉じる
    @objc func commitButtonTapped(sender: UIButton) {
        self.view.endEditing(true)
    }
    
    // キーボード外をタッチした場合にキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
