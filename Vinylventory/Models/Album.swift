//
//  Album.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Album {
    public static var none: Album { return Album(name: "") }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
