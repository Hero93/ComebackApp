//
//  NeedToComeback.swift
//  ComebackApp
//
//  Created by Luca Gramaglia on 25/10/2020.
//

import Foundation

// TODO: I might comeback at a certain time, at a certain location, after n minutes
// So I create a generic one (is time to come back)
// and then a concrete type to implement the different type of comeback

// TODO: change the name of the protocol to "comeback", maybe

protocol NeedToComeback {
    func needsToComeback() -> Bool
}
