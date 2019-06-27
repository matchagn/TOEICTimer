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
        var part5 = Int(minTextFieldPart5.text!)
        
        // Part6の時間入力
        minTextFieldPart6.keyboardType = UIKeyboardType.numberPad
        var part6 = Int(minTextFieldPart6.text!)
        
        // Part7_SinglePassageの時間入力
        minTextFieldPart7_1.keyboardType = UIKeyboardType.numberPad
        var part7_1 = Int(minTextFieldPart7_1.text!)
        
        // Part7_DoublePassageの時間入力
        minTextFieldPart7_2.keyboardType = UIKeyboardType.numberPad
        var part7_2 = Int(minTextFieldPart7_2.text!)
        
        // Part7_TriplePassageの時間入力
        minTextFieldPart7_3.keyboardType = UIKeyboardType.numberPad
        var part7_3 = Int(minTextFieldPart7_3.text!)
        
        // Partごとの時間の合計
        var result = part5 + part6 + part7_1 + part7_2 + part7_3
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // キーボード外をタップするとキーボードを閉じる処理
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

