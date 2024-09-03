//
//  VinylMultipleAdd.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct VinylMultipleAdd<T: PersistentModel, Content: View>: View {
    
    @Binding var list: [T]?
    
    var title: String
    
    var button: String
    
    var addButton: () -> Void
    
    let content: (T) -> Content
    
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
                Button(button, systemImage: "plus", action: addButton)
            }
        }
    }
}
