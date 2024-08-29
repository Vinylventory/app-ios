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
    var catNumber: String
    var dateCreated: Date
    var dateReleased: Date
    var dateEdited: Date
    var notePocket: String
    var pressingLoc: String
    var edition: String
    var weight: Int
    var rank: Int
    var notes: String
    var playedBy: [Artist] = []
    var authored: [Artist] = []
    var credits: [Credit] = []
    var album: Album
    var label: Label
    var tracks: [Track] = []
    var bought: Bought
    var pocketState: PocketState
    var state: VinylState
    var readSpeed: ReadSpeed
    
    init(catNumber: String, dateCreated: Date, dateReleased: Date, dateEdited: Date, notePocket: String, pressingLoc: String, edition: String, weight: Int, rank: Int, notes: String, playedBy: [Artist], authored: [Artist], credits: [Credit], album: Album, label: Label, tracks: [Track], bought: Bought, pocketState: PocketState, state: VinylState, readSpeed: ReadSpeed) {
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
    }
}
