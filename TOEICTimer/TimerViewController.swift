//
//  TimerViewController.swift
//  TOEICTimer
//
//  Created by 松本将輝 on 2019/06/27.
//  Copyright © 2019 masaki.matsumoto. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    // タイマー用の時間（分）のための変数
    var timer_min: Int = 0
    
    // タイマー用の時間（秒）のための変数
    var timer_sec: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UINavigationControllerのタイトルを設定
        self.title = "タイマー"

        // Do any additional setup after loading the view.
        // タイマー（分）用の変数の初期化
        timer_min = 75
        
        // タイマー（秒）用の変数の初期化
        timer_sec = 0
        
        // タイマーの作成、始動
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer_min: Timer) {
        self.timer_min -= 1
        self.timerLabel.text = String(format: "%02d:00", timer_min)
}
    
    // キャンセルボタン
    @IBAction func cancelTimer(_ sender: Any) {
        // リセットボタンを押すと、タイマーの時間を初期値に
        self.timer_min = 75
        self.timerLabel.text = String(format: "%02d:00", timer_min)
    }
    
    // スタートボタン
    @IBAction func startTimer(_ sender: Any) {
        self.timer_min -= 1
        self.timerLabel.text = String(format: "%02d:00", timer_min)
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
