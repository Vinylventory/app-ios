//
//  ListArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI
import SwiftData

struct ListArtistView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Query var artists: [Artist]
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        List {
            ForEach(artists) { artist in
                NavigationLink(value: SeeArtist(artist: artist)) {
                    HStack {
                        Text(artist.surname + " " + artist.name)
                        Spacer()
                        Text(artist.origin)
                    }
                }
            }
            .onDelete(perform: deleteArtist)
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Artist>] = []) {
        _artists = Query(filter: #Predicate { artist in
            if searchString.isEmpty {
                true
            } else {
                artist.surname.localizedStandardContains(searchString)
                || artist.name.localizedStandardContains(searchString)
                || artist.origin.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deleteArtist(at offsets: IndexSet) {
        for offset in offsets {
            let artist = artists[offset]
            if (artist.playedBy == nil || artist.playedBy!.isEmpty) &&
                (artist.authored == nil || artist.authored!.isEmpty) &&
                (artist.credits == nil || artist.credits!.isEmpty) {
                modelContext.delete(artist)
            } else {
                errorMessage = "You can't delete this artist because there is vinyls attached to him."
                error = true
            }
        }
    }
}
