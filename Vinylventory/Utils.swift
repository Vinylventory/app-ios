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

class EditArtist: Hashable {
    
    var artist: Artist
    
    init(artist: Artist) {
        self.artist = artist
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(artist.id)
    }

    static func == (lhs: EditArtist, rhs: EditArtist) -> Bool {
        return lhs.artist.id == rhs.artist.id
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

class EditAlbum: Hashable {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(album.id)
    }

    static func == (lhs: EditAlbum, rhs: EditAlbum) -> Bool {
        return lhs.album.id == rhs.album.id
    }
}

class SeeAlbum: Hashable {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(album.id)
    }

    static func == (lhs: SeeAlbum, rhs: SeeAlbum) -> Bool {
        return lhs.album.id == rhs.album.id
    }
}

class EditLabelGroup: Hashable {
    
    var labelGroup: LabelGroup
    
    init(labelGroup: LabelGroup) {
        self.labelGroup = labelGroup
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(labelGroup.id)
    }

    static func == (lhs: EditLabelGroup, rhs: EditLabelGroup) -> Bool {
        return lhs.labelGroup.id == rhs.labelGroup.id
    }
}

class SeeLabelGroup: Hashable {
    
    var labelGroup: LabelGroup
    
    init(labelGroup: LabelGroup) {
        self.labelGroup = labelGroup
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(labelGroup.id)
    }

    static func == (lhs: SeeLabelGroup, rhs: SeeLabelGroup) -> Bool {
        return lhs.labelGroup.id == rhs.labelGroup.id
    }
}

class EditBought: Hashable {
    
    var bought: Bought
    
    init(bought: Bought) {
        self.bought = bought
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bought.id)
    }

    static func == (lhs: EditBought, rhs: EditBought) -> Bool {
        return lhs.bought.id == rhs.bought.id
    }
}

class SeeBought: Hashable {
    
    var bought: Bought
    
    init(bought: Bought) {
        self.bought = bought
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(bought.id)
    }

    static func == (lhs: SeeBought, rhs: SeeBought) -> Bool {
        return lhs.bought.id == rhs.bought.id
    }
}
