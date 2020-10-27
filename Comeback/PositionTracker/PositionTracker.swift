//
//  PositionTracker.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 22/10/2020.
//

import Foundation

protocol PositionTracker {
    func startRequest(completion: ((_ coordinate: Coordinate?) -> Void))
    func stop()
}
