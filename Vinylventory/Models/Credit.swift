//
//  Credit.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Credit {
    var role: String = ""
    var note: String = ""
    
    @Relationship(inverse: \Artist.credits) var artist: Artist?
    
    var vinyl: Vinyl?
    
    init(role: String, note: String, artist: Artist? = nil, vinyl: Vinyl? = nil) {
        self.role = role
        self.note = note
        self.artist = artist
        self.vinyl = vinyl
    }
}
