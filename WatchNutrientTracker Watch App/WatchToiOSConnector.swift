//
//  WatchToiOSConnector.swift
//  WatchNutrientTracker Watch App
//
//  Created by Apple on 19/03/24.
//

import Foundation

import WatchConnectivity

class WatchToiOSConnector: NSObject, WCSessionDelegate, ObservableObject {
    
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sendMacroToiOS(macro: Macro) {
        if session.isReachable {
            let data: [String: Any] = [
                "food": macro.food,
                "createdAt": macro.createdAt,
                "date": macro.date,
                "carbs": macro.carbs,
                "fats": macro.fats,
                "proteins": macro.proteins
            ]
            
            session.sendMessage(data, replyHandler: nil) {
                error in print(error.localizedDescription)
            }
        }
        else{
            print("session is not reachable")
        }
    }
    
    
}
