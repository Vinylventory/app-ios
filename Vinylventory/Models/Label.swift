//
//  Label.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Label {
    public static var none: Label { return Label(name: "") }
    
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
