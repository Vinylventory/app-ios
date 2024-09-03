//
//  AlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct AlbumView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var path: NavigationPath
    
    @State private var sortOrder = [SortDescriptor(\Album.name)]
    @State private var searchText = ""
    
    var body: some View {
        ListAlbumView(searchString: searchText, sortOrder: sortOrder)
        .navigationBarTitle("Album List", displayMode: .large)
        .toolbar {
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Name (A-Z)")
                        .tag([SortDescriptor(\Album.name)])
                    
                    Text("Name (Z-A)")
                        .tag([SortDescriptor(\Album.name, order: .reverse)])
                }
            }
            
            Button("Add Album", systemImage: "plus", action: addArtist)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func addArtist() {
        let album = Album(name: "")
        path.append(album)
    }
}
