//
//  ListAlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct ListAlbumView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var albums: [Album]
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        List {
            ForEach(albums) { album in
                NavigationLink(value: SeeAlbum(album: album)) {
                    HStack {
                        Text(album.name)
                        Spacer()
                        Text((album.vinyls != nil ? String(album.vinyls!.count) : "0") + " vinyl" + (album.vinyls != nil && album.vinyls!.count > 1 ? "s" : ""))
                            .foregroundStyle(.gray)
                    }
                }
            }
            .onDelete(perform: deleteArtist)
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Album>] = []) {
        _albums = Query(filter: #Predicate { album in
            if searchString.isEmpty {
                true
            } else {
                album.name.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteArtist(at offsets: IndexSet) {
        for offset in offsets {
            let album = albums[offset]
            if (album.vinyls == nil || album.vinyls!.isEmpty) {
                modelContext.delete(album)
            } else {
                errorMessage = "You can't delete this album because there is vinyls attached to him."
                error = true
            }
        }
    }
}
