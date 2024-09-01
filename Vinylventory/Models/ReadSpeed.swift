//
//  ReadSpeed.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation

enum ReadSpeed: Codable, Identifiable, CaseIterable {
    case s78
    case s45
    case s33
    
    var id: String { self.description }
    
    var description: String {
        switch self {
        case .s78:
            return "78"
        case .s45:
            return "45"
        case .s33:
            return "33 1/3"
        }
    }
}
