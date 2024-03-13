//
//  ViewController.swift
//  ClockApp
//
//  Created by Mac on 2024-03-13.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeLabel2: UILabel!
    
    var countDownClock = 10 * 60 // 10 minutes in seconds
    var countDownClock2 = 10 * 60 // 10 minutes in seconds
    
    var timer: Timer?
    var isClock1Active = true // To track which clock is active
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDisplay(for: countDownClock, label: timeLabel)
        updateDisplay(for: countDownClock2, label: timeLabel2)
    }
    
    @IBAction func startButton(_ sender: Any) {
        startTimer()
    }
    
    @IBAction func turnButton1(_ sender: Any) {
        switchClocks(isClock1Active: false)
    }
    
    @IBAction func turnButton2(_ sender: Any) {
        switchClocks(isClock1Active: true)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    
    @objc func update() {
        if isClock1Active {
            if countDownClock > 0 {
                countDownClock -= 1
                updateDisplay(for: countDownClock, label: timeLabel)
            }
        } else {
            if countDownClock2 > 0 {
                countDownClock2 -= 1
                updateDisplay(for: countDownClock2, label: timeLabel2)
            }
        }
    }
    
    func switchClocks(isClock1Active: Bool) {
        self.isClock1Active = isClock1Active
    }
    
    func updateDisplay(for timeInSeconds: Int, label: UILabel) {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        label.text = String(format: "%02d:%02d", minutes, seconds)
    }
    
    deinit {
        timer?.invalidate()
    }
}


