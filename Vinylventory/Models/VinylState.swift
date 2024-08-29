//
//  VinylState.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import Foundation

enum VinylState: Codable {
    case none
    case mint
    case nearMint
    case veryGoodPlus
    case veryGood
    case goodPlus
    case good
    case fair
    case poor
    
    var description: String {
        switch self {
        case .none:
            return "None"
        case .mint:
            return "Mint (M)"
        case .nearMint:
            return "Near Mint (NM or M-)"
        case .veryGoodPlus:
            return "Very Good Plus (VG+)"
        case .veryGood:
            return "Very Good (VG)"
        case .goodPlus:
            return "Good Plus (G+)"
        case .good:
            return "Good (G)"
        case .fair:
            return "Fair (F)"
        case .poor:
            return "Poor (P)"
        }
    }
}
