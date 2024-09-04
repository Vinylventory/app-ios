//
//  VinylMultipleAdd.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct VinylMultipleAdd<T: PersistentModel, Content: View, Content2: View>: View {
    
    @Binding var list: [T]?
    
    var title: String
    
    var button: String
    
    let sheet: (Binding<Bool>) -> Content
    
    let content: (T) -> Content2
    
    @State private var show: Bool = false
    
    var body: some View {
        Section(header: Text(title)) {
            List {
                if list != nil && !list!.isEmpty {
                    ForEach(list!) { value in
                        content(value)
                    }
                    .onDelete(perform: { offsets in
                        for offset in offsets {
                            list!.remove(at: offset)
                        }
                    })
                }
                Button(action: { show = true }) {
                    Label(button, systemImage: "plus")
                }
                .sheet(isPresented: $show) {
                    sheet($show)
                }
            }
        }
    }
}
