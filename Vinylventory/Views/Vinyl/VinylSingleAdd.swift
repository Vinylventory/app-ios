//
//  VinylSingleAdd.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 04.09.2024.
//

import SwiftUI
import SwiftData

struct VinylSingleAdd<T: PersistentModel, Content: View>: View {
    
    @Binding var value: T?
    
    var title: String
    
    var button: String
    
    var addButton: () -> Void
    
    let content: () -> Content
    
    var body: some View {
        Section(header: Text(title)) {
            if value == nil {
                Button(title, systemImage: "plus", action: addButton)
            } else {
                content()
            }
        }
    }
}
