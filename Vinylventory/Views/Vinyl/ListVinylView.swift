//
//  VinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import SwiftUI
import SwiftData

struct ListVinylView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var vinyls: [Vinyl]
    
    var body: some View {
        List {
            ForEach(vinyls) { vinyl in
                NavigationLink(value: SeeVinyl(vinyl: vinyl)) {
                    HStack {
                        if vinyl.label != nil {
                            Text(vinyl.label!.name)
                        }
                        Text(vinyl.catNumber)
                    }
                }
            }
            .onDelete(perform: deleteVinyl)
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Vinyl>] = []) {
        _vinyls = Query(filter: #Predicate { vinyl in
            if searchString.isEmpty {
                true
            } else {
                vinyl.catNumber.localizedStandardContains(searchString)
                || vinyl.notes.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteVinyl(at offsets: IndexSet) {
        for offset in offsets {
            let vinyl = vinyls[offset]
            modelContext.delete(vinyl)
        }
    }
}
