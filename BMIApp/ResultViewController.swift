//
//  ResultViewController.swift
//  BMIApp
//
//  Created by 早坂甫 on 2018/11/26.
//  Copyright © 2018年 早坂甫. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // BMIの判定結果
    enum BMIResultState: String {
        case Obesity = "太りすぎです！"   // 太っている
        case Normal = "健康です！"       // 正常
        case Slender = "もっと食べて！"   // 痩せている
    }
    
    // BMIの計算結果格納用
    var calcBMIResultValue: Double = 0.0
    
    // BMI結果の画像格納用
    let obesityImage = UIImage(named: "obesityImage")   // 太りすぎな場合の画像
    let normalImage = UIImage(named: "normalImage")     // 正常な場合の画像
    let slenderImage = UIImage(named: "slenderImage")   // 痩せている場合の画像

    override func viewDidLoad() {
        super.viewDidLoad()

        // 背景色を変更（白）
        self.view.backgroundColor = UIColor.white

        // タイトル表示 ---------------------------------------------------------------
        let bmiTitleLabel = UILabel()
        bmiTitleLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        bmiTitleLabel.font = UIFont.systemFont(ofSize: 30) // フォントサイズを変更
        bmiTitleLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.1,
                                width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        bmiTitleLabel.textAlignment = NSTextAlignment.center // 中央揃え
        bmiTitleLabel.text = "BMI" // タイトルを設定
        self.view.addSubview(bmiTitleLabel)
        
        // BMIの数値を表示 ---------------------------------------------------------------
        let bmiResultLabel = UILabel()
        bmiResultLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        bmiResultLabel.font = UIFont.systemFont(ofSize: 50) // フォントサイズを変更
        bmiResultLabel.frame = CGRect(x: view.frame.width * 0.1, y: view.frame.height * 0.18,
                                width: view.frame.width * 0.8, height: view.frame.height * 0.1) // 表示位置を設定
        bmiResultLabel.textAlignment = NSTextAlignment.center // 中央揃え
        bmiResultLabel.text = String(calcBMIResultValue) // タイトルを設定
        self.view.addSubview(bmiResultLabel)
        
        // 結果の表示処理 ---------------------------------------------------------------
        switch judgmentResultOfBMI(value: calcBMIResultValue) {
        case BMIResultState.Obesity:
            dispResult(image: obesityImage, comment: BMIResultState.Obesity.rawValue)
        case BMIResultState.Normal:
            dispResult(image: normalImage, comment: BMIResultState.Normal.rawValue)
        case BMIResultState.Slender:
            dispResult(image: slenderImage, comment: BMIResultState.Slender.rawValue)
        }
        
        // 閉じるボタンの生成 ---------------------------------------------------------------
        let closeButton = UIButton()
        closeButton.backgroundColor = UIColor(named: "buttonPink")   // ボタンの色をピンク色（buttonPink）に設定
        closeButton.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.8,
                                     width: view.frame.width * 0.5, height: view.frame.height * 0.1) // 横の位置を中央に設定
        closeButton.setTitleColor(UIColor(named: "textGray"), for: .normal) // ボタンの文字をグレー色（textGray）に設定
        closeButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        closeButton.layer.cornerRadius = 20 // ボタンに丸みを付ける
        closeButton.setTitle("閉じる", for: .normal)
        self.view.addSubview(closeButton)
        
        // 閉じるボタンが押された時の処理を実行
        closeButton.addTarget(self, action: #selector(closeButtonClicked(sender:)), for:.touchUpInside)
        
        // Do any additional setup after loading the view.
    }
    
    // 閉じるボタンを押された時の処理
    @objc func closeButtonClicked(sender: UIButton){
        print("closeButtonClicked")
        self.dismiss(animated: true, completion: nil) // dismiss は自分自身を消す。結果として裏のレイアウトU（前の画面）が表示される。
    }

    func dispResult(image: UIImage!, comment: String) {
        // 画像表示
        let dispImage = image
        let dispImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: 250.0, height: 250.0))
        dispImageView.image = dispImage
        dispImageView.center = view.center
        self.view.addSubview(dispImageView)
        
        // 結果のコメント表示
        let bmiCommentsLabel = UILabel()
        bmiCommentsLabel.textColor = UIColor(named: "textGray") // ボタンの色をグレー色（textGray）に設定
        bmiCommentsLabel.font = UIFont.systemFont(ofSize: 25) // フォントサイズを変更
        bmiCommentsLabel.frame = CGRect(x: view.frame.width * 0.25, y: view.frame.height * 0.7,
                                        width: view.frame.width * 0.5, height: view.frame.height * 0.1) // 横の位置を中央に設定
        bmiCommentsLabel.textAlignment = NSTextAlignment.center // 中央揃え
        bmiCommentsLabel.text = String(comment) // タイトルを設定
        self.view.addSubview(bmiCommentsLabel)
    }
    
    func judgmentResultOfBMI(value: Double) -> BMIResultState {
        if value >= 25.0 {
            return BMIResultState.Obesity
        } else if value >= 18.5 {
            return BMIResultState.Normal
        } else {
            return BMIResultState.Slender
        }
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
