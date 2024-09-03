//
//  Vinyl.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Vinyl {
    var catNumber: String = ""
    var dateCreated: Date?
    var dateReleased: Date?
    var dateEdited: Date?
    var notePocket: String = ""
    var pressingLoc: String = ""
    var edition: String = ""
    var weight: Float? = nil
    var rank: Int? = nil
    var notes: String = ""
    
    @Relationship(inverse: \Artist.playedBy) var playedBy: [Artist]?
    @Relationship(inverse: \Artist.authored) var authored: [Artist]?
    @Relationship(inverse: \Credit.vinyl) var credits: [Credit]?
    @Relationship(inverse: \Album.vinyls) var album: Album?
    @Relationship(inverse: \LabelGroup.vinyls) var label: LabelGroup?
    @Relationship(inverse: \Track.vinyls) var tracks: [Track]?
    @Relationship(inverse: \Bought.vinyls) var bought: Bought?
    
    var pocketState: PocketState?
    var state: VinylState?
    var readSpeed: ReadSpeed?
    
    @Relationship(deleteRule: .cascade, inverse: \ImageModel.vinyl) var images: [ImageModel]?

    init(catNumber: String, dateCreated: Date? = nil, dateReleased: Date? = nil, dateEdited: Date? = nil, notePocket: String, pressingLoc: String, edition: String, weight: Float? = nil, rank: Int? = nil, notes: String, playedBy: [Artist]? = nil, authored: [Artist]? = nil, credits: [Credit]? = nil, album: Album? = nil, label: LabelGroup? = nil, tracks: [Track]? = nil, bought: Bought? = nil, pocketState: PocketState? = nil, state: VinylState? = nil, readSpeed: ReadSpeed? = .s78, images: [ImageModel]? = nil) {
        self.catNumber = catNumber
        self.dateCreated = dateCreated
        self.dateReleased = dateReleased
        self.dateEdited = dateEdited
        self.notePocket = notePocket
        self.pressingLoc = pressingLoc
        self.edition = edition
        self.weight = weight
        self.rank = rank
        self.notes = notes
        self.playedBy = playedBy
        self.authored = authored
        self.credits = credits
        self.album = album
        self.label = label
        self.tracks = tracks
        self.bought = bought
        self.pocketState = pocketState
        self.state = state
        self.readSpeed = readSpeed
        self.images = images
    }
}
