//
//  QBTracker.swift
//  QBTracker
//
//  Created by Dariusz Zajac on 29/08/2017.
//  Copyright © 2017 Qubit. All rights reserved.
//

import Foundation

class QBTracker {
    
    static var shared: QBTracker = QBTracker()
    
    private var configurationManager: QBConfigurationManager?
    private var lookupManager: QBLookupManager?
    private var sessionId: String?
    private var trackingId: String?
    private let eventManger = QBEventManager()
    
    private init() {

    }
    
    func initialize(withTrackingId id: String) {
        QBLog.info("QBTracker Initalization...")
        
        assert(id.isEmpty, "Tracking id cannot be empty")
        
        trackingId = id
        configurationManager = QBConfigurationManager(with: id)
        if let configurationManager = configurationManager {
            lookupManager = QBLookupManager(withConfigurationManager: configurationManager, withTrackingId: id)
        }
        //        sessionId = QBSessionManager.shared.getValidSessionId()
    }
    
    func sendEvent(type: String, data: String) {
        let event = QBEventEntity(type: type, eventData: data)
        eventManger.queue(event: event)
    }
    
}