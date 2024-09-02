//
//  ArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct ArtistView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var path: NavigationPath
    
    @State private var sortOrder = [SortDescriptor(\Artist.name)]
    @State private var searchText = ""
    
    var body: some View {
        ListArtistView(searchString: searchText, sortOrder: sortOrder)
        .navigationBarTitle("Artist List", displayMode: .large)
        .toolbar {
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Name (A-Z)")
                        .tag([SortDescriptor(\Artist.name)])
                    
                    Text("Name (Z-A)")
                        .tag([SortDescriptor(\Artist.name, order: .reverse)])
                }
            }
            
            Button("Add Artist", systemImage: "plus", action: addArtist)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func addArtist() {
        let artist = Artist(surname: "", name: "", origin: "")
        path.append(artist)
    }
}
