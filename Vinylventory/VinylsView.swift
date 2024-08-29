//
//  VinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import SwiftUI
import SwiftData

struct VinylsView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var vinyls: [Vinyl]
    
    var body: some View {
        List {
            ForEach(vinyls) { vinyl in
                NavigationLink(value: vinyl) {
                    Text(vinyl.catNumber)
                }
            }
            .onDelete(perform: deleteVinyl)
        }
    }
    
    func deleteVinyl(at offsets: IndexSet) {
        for offset in offsets {
            let vinyl = vinyls[offset]
            modelContext.delete(vinyl)
        }
    }
}

#Preview {
    VinylsView()
}
