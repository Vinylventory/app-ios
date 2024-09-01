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
