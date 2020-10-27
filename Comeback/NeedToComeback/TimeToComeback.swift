//
//  TimeToComeback.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 25/10/2020.
//

import Foundation

// Class to calculate when it's time to come back
// TODO: I can calculate the new time also (if I'll arrive late) with the seconds left to reach destination

class TimeToComeback: NeedToComeback {

    private let timeToComeback: Time
//    private let secondsLeftToReachDestination: TimeInterval

    init(timeToComeback: Time) {
        self.timeToComeback = timeToComeback
    }
    
    func needsToComeback() -> Bool {
        
        let now = Date()
        
        var nowDateComponents = DateComponents()
        nowDateComponents.hour = Calendar.current.component(.hour, from: now)
        nowDateComponents.minute = Calendar.current.component(.minute, from: now)
        
        var timeToComebackDateComponents = DateComponents()
        timeToComebackDateComponents.hour = timeToComeback.hour
        timeToComebackDateComponents.minute = timeToComeback.minute
                
        return nowDateComponents.date == timeToComebackDateComponents.date
    }
}
