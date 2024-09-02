//
//  Utils.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 31.08.2024.
//

import Foundation

class EditVinyl: Hashable {
    
    var vinyl: Vinyl
    
    init(vinyl: Vinyl) {
        self.vinyl = vinyl
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(vinyl.id)
    }

    static func == (lhs: EditVinyl, rhs: EditVinyl) -> Bool {
        return lhs.vinyl.id == rhs.vinyl.id
    }
}

class SeeVinyl: Hashable {
    
    var vinyl: Vinyl
    
    init(vinyl: Vinyl) {
        self.vinyl = vinyl
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(vinyl.id)
    }

    static func == (lhs: SeeVinyl, rhs: SeeVinyl) -> Bool {
        return lhs.vinyl.id == rhs.vinyl.id
    }
}

class SeeArtist: Hashable {
    
    var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(artist.id)
    }

    static func == (lhs: SeeArtist, rhs: SeeArtist) -> Bool {
        return lhs.artist.id == rhs.artist.id
    }
}
