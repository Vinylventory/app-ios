//
//  Artist.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Artist {
    var surname: String
    var name: String
    var origin: String
    
    init(surname: String, name: String, origin: String) {
        self.surname = surname
        self.name = name
        self.origin = origin
    }
}
