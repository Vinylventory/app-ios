//
//  Track.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Track {
    var name: String
    var duration: Int
    
    init(name: String, duration: Int) {
        self.name = name
        self.duration = duration
    }
}
