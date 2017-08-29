//
//  ViewController.swift
//  SwiftTestApp
//
//  Created by Dariusz Zajac on 23/08/2017.
//  Copyright © 2017 Qubit. All rights reserved.
//

import UIKit
//import QBTracker
@testable import QBTracker

class ViewController: UIViewController {
    
    var manager: QBConfigurationManager?
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerTick), userInfo: nil, repeats: true)
    }
    
    @objc func timerTick() {
        print("tick")
    }

}

