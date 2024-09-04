//
//  VinylSingleAdd.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 04.09.2024.
//

import SwiftUI
import SwiftData

struct VinylSingleAdd<T: PersistentModel, Content: View, Content2: View>: View {
    
    @Binding var value: T?
    
    var title: String
    
    var button: String
    
    var sheet: (Binding<Bool>) -> Content
    
    var content: () -> Content2
    
    @State private var show: Bool = false
    
    var body: some View {
        Section(header: Text(title)) {
            if value == nil {
                Button(title, systemImage: "plus", action: { show = true })
                    .sheet(isPresented: $show) {
                        sheet($show)
                    }
            } else {
                content()
                    .sheet(isPresented: $show) {
                        sheet($show)
                    }
            }
        }
    }
}
