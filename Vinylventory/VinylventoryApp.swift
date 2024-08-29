//
//  VinylventoryApp.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI
import SwiftData

@main
struct VinylventoryApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Vinyl.self)
    }
}

extension Date {
    public static var none: Date { return Date(timeIntervalSince1970: 0) }
}
