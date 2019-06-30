//
//  TimerViewController.swift
//  TOEICTimer
//
//  Created by 松本将輝 on 2019/06/27.
//  Copyright © 2019 masaki.matsumoto. All rights reserved.
//

import UIKit
import UserNotifications

class TimerViewController: UIViewController, UNUserNotificationCenterDelegate {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startStopBtn: UIButton!
    
    // タイマー
    var timer: Timer!
    
    // タイマー用の時間（分）のための変数
    var timer_min: Int = 0
    
    // タイマー用の時間（秒）のための変数
    var timer_sec: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UINavigationControllerのタイトルを設定
        self.title = "タイマー"
        
        // タイマーの作成、始動
       self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
    }
    
    // selector: #selector(updatetimer(_:)) で指定された関数
    // timeInterval: 0.1, repeats: true で指定された通り、0.1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer_min: Timer) {
        // タイマーの時間（分、秒）の設定
        self.timer_sec += 1
        let seconds = self.timer_min * 60 - timer_sec
        let minutes = seconds / 60
        self.timerLabel.text = String(format: "%02d:%02d", minutes, seconds % 60)
        
        // ローカル通知の内容
        let content = UNMutableNotificationContent()
        content.sound = UNNotificationSound.default
        content.title = "Finish!"
        content.body = "おつかれさまでした。"
        
        // ローカル通知リクエストを作成
        if minutes == 0 && seconds == 0 {
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.1, repeats: false)
        let identifier = NSUUID().uuidString
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request){ (error : Error?) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
        }
    }
    
    // キャンセルボタン
    @IBAction func cancelTimer(_ sender: Any) {
        // キャンセルボタンを押すと、タイマーの時間を設定した時間に初期化する
        self.timer_sec = 0
        self.timerLabel.text = String(format: "%02d:%02d", timer_min, timer_sec)
        
        // キャンセルボタンを押した時、Pause/ResumeボタンをStartボタンに変更する処理
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
        startStopBtn.setTitle("Start", for: .normal)
    }
    
    // Start/Pause/Resumeボタン
    @IBAction func startTimer(_ sender: Any) {
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startStopBtn.setTitle("Resume", for: .normal)
        }else{
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            startStopBtn.setTitle("Pause", for: .normal)
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
