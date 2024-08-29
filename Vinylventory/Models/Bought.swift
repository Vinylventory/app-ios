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
    
    public static var none: Bought { return Bought(loc: "", date: .none, price: 0, note: "") }
    
    var loc: String
    var date: Date
    var price: Int
    var note: String
    
    init(loc: String, date: Date, price: Int, note: String) {
        self.loc = loc
        self.date = date
        self.price = price
        self.note = note
    }
}
