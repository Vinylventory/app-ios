//
//  Label.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class LabelGroup {
    var name: String = ""
    
    var vinyls: [Vinyl]?
    
    init(name: String) {
        self.name = name
    }
}
