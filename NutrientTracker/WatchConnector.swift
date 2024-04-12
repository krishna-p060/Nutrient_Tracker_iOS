//
//  WatchConnector.swift
//  NutrientTracker
//
//  Created by Apple on 19/03/24.
//

import Foundation
import WatchConnectivity
import SwiftData

class WatchConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    
    var session: WCSession
    var modelContext: ModelContext? = nil
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        //print(message)
        let macro = Macro(food: message["food"] as? String ?? "Not found", createdAt: message["createdAt"] as? Date ?? Date.now, date: message["date"] as? Date ?? Date.now, carbs: message["carbs"] as? Int ?? 0, fats: message["fats"] as? Int ?? 0, proteins: message["proteins"] as? Int ?? 0)
        
        modelContext?.insert(macro)
    }
}
