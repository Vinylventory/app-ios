//
//  Bought.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation
import SwiftData

@Model
class Bought {    
    var loc: String = ""
    var date: Date?
    var price: Int = 0
    var note: String = ""
    
    var vinyls: [Vinyl]?
    
    init(loc: String, date: Date? = nil, price: Int, note: String, vinyls: [Vinyl]? = nil) {
        self.loc = loc
        self.date = date
        self.price = price
        self.note = note
        self.vinyls = vinyls
    }
}
