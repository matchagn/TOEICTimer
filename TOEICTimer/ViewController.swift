//
//  ViewController.swift
//  TOEICTimer
//
//  Created by 松本将輝 on 2019/06/26.
//  Copyright © 2019 masaki.matsumoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var homeTimerLabel: UILabel!
    @IBOutlet weak var minTextFieldPart5: UITextField!
    @IBOutlet weak var minTextFieldPart6: UITextField!
    @IBOutlet weak var minTextFieldPart7_1: UITextField!
    @IBOutlet weak var minTextFieldPart7_2: UITextField!
    @IBOutlet weak var minTextFieldPart7_3: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Part5の時間入力
        minTextFieldPart5.keyboardType = UIKeyboardType.numberPad
        var part5 = Int(minTextFieldPart5.text!) ?? 0
        
        // Part6の時間入力
        minTextFieldPart6.keyboardType = UIKeyboardType.numberPad
        var part6 = Int(minTextFieldPart6.text!) ?? 0
        
        // Part7_SinglePassageの時間入力
        minTextFieldPart7_1.keyboardType = UIKeyboardType.numberPad
        var part7_1 = Int(minTextFieldPart7_1.text!) ?? 0
        
        // Part7_DoublePassageの時間入力
        minTextFieldPart7_2.keyboardType = UIKeyboardType.numberPad
        var part7_2 = Int(minTextFieldPart7_2.text!) ?? 0
        
        // Part7_TriplePassageの時間入力
        minTextFieldPart7_3.keyboardType = UIKeyboardType.numberPad
        var part7_3 = Int(minTextFieldPart7_3.text!) ?? 0
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // HOMEで入力した値を合計して、タイマーに反映する処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TimerViewController {
            let part5 = Int(minTextFieldPart5.text!) ?? 0
            let part6 = Int(minTextFieldPart6.text!) ?? 0
            let part7_1 = Int(minTextFieldPart7_1.text!) ?? 0
            let part7_2 = Int(minTextFieldPart7_2.text!) ?? 0
            let part7_3 = Int(minTextFieldPart7_3.text!) ?? 0
            viewController.timer_min = part5 + part6 + part7_1 + part7_2 + part7_3
            viewController.remainingTimerPart5_min = part5
            viewController.remainingTimerPart6_min = part6
            viewController.remainingTimerPart7_1_min = part7_1
            viewController.remainingTimerPart7_2_min = part7_2
            viewController.remainingTimerPart7_3_min = part7_3
        }
    }
    
    // キーボード外をタップするとキーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
        let part5 = Int(minTextFieldPart5.text!) ?? 0
        let part6 = Int(minTextFieldPart6.text!) ?? 0
        let part7_1 = Int(minTextFieldPart7_1.text!) ?? 0
        let part7_2 = Int(minTextFieldPart7_2.text!) ?? 0
        let part7_3 = Int(minTextFieldPart7_3.text!) ?? 0
        // Partごとの時間の合計
        var result = part5 + part6 + part7_1 + part7_2 + part7_3
        
        // 合計した時間を表示
        self.homeTimerLabel.text = String(result)
    }
}

