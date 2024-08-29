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
    var role: String
    var note: String
    var artist: Artist
    
    init(role: String, note: String, artist: Artist) {
        self.role = role
        self.note = note
        self.artist = artist
    }
}
