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
    var name: String = ""
    var duration: Int?
    
    var vinyls: [Vinyl]?
    
    init(name: String, duration: Int? = nil, vinyls: [Vinyl]? = nil) {
        self.name = name
        self.duration = duration
        self.vinyls = vinyls
    }
}
