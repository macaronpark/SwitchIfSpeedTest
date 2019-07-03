//
//  ViewController.swift
//  SwitchIfSpeedTest
//
//  Created by Suzy Park on 03/07/2019.
//  Copyright © 2019 Suzy Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var buttonOne: UIButton!
  @IBOutlet weak var buttonTwo: UIButton!
  @IBOutlet weak var buttonThree: UIButton!
  @IBOutlet weak var buttonFour: UIButton!
  @IBOutlet weak var buttonFive: UIButton!
  @IBOutlet weak var label: UILabel!
  
  var startNanoSec: Int = 0
  var endNanoSec: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.addAction()
    
    // get total and average
    // let _if = 1708031 + 123977 + 141978 + 123024 + 124931
    // let _switch = 1942992 + 124931 + 118971 + 121951 + 120998
    
    // print("if: ", _if)
    // print("switch: ", _switch)
    // print("\nresult: ", (_switch) - (_if))
    // print("average: ", (_switch / 5) - (_if / 5))
  }
  
  @objc func didButtonsTap(_ sender: UIButton) {
    currentTime("\nstart", isStart: true)
    label.text = sender.titleLabel?.text
    
    // TEST: IF
    if sender == self.buttonOne {
      currentTime("end_1")
    } else if sender == self.buttonTwo {
      currentTime("end_2")
    } else if sender == self.buttonThree {
      currentTime("end_3")
    } else if sender == self.buttonFour {
      currentTime("end_4")
    } else if sender == self.buttonFive {
      currentTime("end_5")
    }
    
    // TEST: SWITCH
    //    switch sender {
    //    case buttonOne:
    //      currentTime("end_1")
    //    case buttonTwo:
    //      currentTime("end_2")
    //    case buttonThree:
    //      currentTime("end_3")
    //    case buttonFour:
    //      currentTime("end_4")
    //    case buttonFive:
    //      currentTime("end_5")
    //    default: break
    //    }
    
    timeGap()
  }
  
  fileprivate func addAction() {
    self.buttonOne.addTarget(self, action: #selector(didButtonsTap(_:)), for: .touchUpInside)
    self.buttonTwo.addTarget(self, action: #selector(didButtonsTap(_:)), for: .touchUpInside)
    self.buttonThree.addTarget(self, action: #selector(didButtonsTap(_:)), for: .touchUpInside)
    self.buttonFour.addTarget(self, action: #selector(didButtonsTap(_:)), for: .touchUpInside)
    self.buttonFive.addTarget(self, action: #selector(didButtonsTap(_:)), for: .touchUpInside)
  }
  
  fileprivate func currentTime(_ title: String, isStart: Bool = false) {
    let date = Date()
    let calendar = Calendar.current
    let minute = calendar.component(.minute, from: date)
    let second = calendar.component(.second, from: date)
    let nanosecond = calendar.component(.nanosecond, from: date)
    print("\(title): \(minute):\(second):\(nanosecond)")
    
    if isStart {
      self.startNanoSec = nanosecond
    } else {
      self.endNanoSec = nanosecond
    }
  }
  
  fileprivate func timeGap() {
    let gap = self.endNanoSec - self.startNanoSec
    print("time_gap: ", gap)
  }
}

