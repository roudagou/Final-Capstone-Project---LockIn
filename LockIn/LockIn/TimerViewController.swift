//
//  TimerViewController.swift
//  LockIn
//
//  Created by Roua Dagoushin on 8/6/25.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timeInput: UITextField!
    
    var timer: Timer?
    var secondsRemaining = 0

    @IBAction func startTimer(_ sender: UIButton) {
        guard let input = timeInput.text, let seconds = Int(input) else { return }
        secondsRemaining = seconds
        updateLabel()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.secondsRemaining -= 1
            self.updateLabel()
            if self.secondsRemaining <= 0 {
                self.timer?.invalidate()
            }
        }
    }

    func updateLabel() {
        timeLabel.text = "\(secondsRemaining) seconds"
    }
}

