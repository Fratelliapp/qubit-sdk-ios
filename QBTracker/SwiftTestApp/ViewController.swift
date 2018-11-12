//
//  ViewController.swift
//  SwiftTestApp
//
//  Created by Dariusz Zajac on 23/08/2017.
//  Copyright © 2017 Qubit. All rights reserved.
//

import UIKit
import QubitSDK

class ViewController: UIViewController {

    var timer: Timer?
    @IBOutlet weak var eventsLabel: UILabel!
    
    override func viewDidLoad() {
        QubitSDK.start(withTrackingId: "miquido", logLevel: .debug)
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        printCurrentContext()
        fetchExperiences()
    }
    
    private func printCurrentContext() {
        print(QubitSDK.trackingId)
        print(QubitSDK.deviceId)
    }
    
    private func fetchExperiences() {
        QubitSDK.fetchExperiences(withIds: [143640], onSuccess: { (experiences) in
            if let exp = experiences.first {
                // exp.payload [String: Any] contains the values set in app.qubit.com
                // Call the shown method once the user experience has been changed
                exp.shown()
            }
        }, onError: { (error) in
            print("Got error: \(error.localizedDescription)")
        }, preview: true, ignoreSegments: true)
    }
    
    @IBAction func tapOnEventButton(_ sender: UIButton) {
        for _ in 0...10 {
            QubitSDK.sendEvent(type: "View", data: "{\"type\" : \"tapOnEventButton\", \"number\":2.2}")
        }
    }
    
    @IBAction func tapOnCreateEventButton(_ sender: UIButton) {
        let event = QubitSDK.createEvent(type: "Product", dictionary: ["eventType": "tapOnCreateEventButton", "number": 2.2])
        QubitSDK.sendEvent(event: event)
    }
}
