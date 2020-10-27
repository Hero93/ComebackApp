//
//  ComebackTracker.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 22/10/2020.
//

import Foundation

struct ComebackResult {
    let timeInterval: TimeInterval?
    let isTimeToComeback: Bool
}

protocol ComebackTrackerProtocol {
    func start(with comebackPlace: Place, updateHandler: @escaping (ComebackResult) -> Void)
    func stop()
}

// TODO: I don't know if using "ComebackTrackerProtocol" it's a good idea.

class ComebackTracker: ComebackTrackerProtocol {
    
    private let positionTracker: PositionTracker
    private let timeDistanceCalculator: TimeDistanceCalculator
    private let needToComeback: NeedToComeback
        
    // MARK: - Init
    
    init(positionTracker: PositionTracker, timeDistanceCalculator: TimeDistanceCalculator, needToComeback: NeedToComeback) {
        self.positionTracker = positionTracker
        self.timeDistanceCalculator = timeDistanceCalculator
        self.needToComeback = needToComeback
    }
    
    // MARK: - Public methods
    
    func start(with comebackPlace: Place, updateHandler: @escaping (ComebackResult) -> Void) {
        
        positionTracker.startRequest { [weak self] coordinate in
            
            guard let coordinate = coordinate else { return }
            let userLocation = Place(coordinate: coordinate, description: nil)
            
            timeDistanceCalculator.calculate(from: userLocation, to: comebackPlace) { result in

                switch result {
                case .success(let timeInterval):
                    let result = ComebackResult(timeInterval: timeInterval,
                                                isTimeToComeback: self?.needToComeback.needsToComeback() ?? false)
                    updateHandler(result)
                case .failure(let wsError):
                    print("failure: \(wsError)")
                }
            }
        }
    }
    
    func stop() {
        positionTracker.stop()
    }
}
