//
//  TimeDistanceTracker.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 20/10/2020.
//

import Foundation

protocol TimeDistanceCalculator {
    func calculate(from place: Place, to: Place, completion: @escaping (_ timeInterval: Result<TimeInterval, Error>) -> Void)
}

protocol WalkTimeDistanceCalculator: TimeDistanceCalculator {}
protocol CarTimeDistanceCalculator: TimeDistanceCalculator {}
