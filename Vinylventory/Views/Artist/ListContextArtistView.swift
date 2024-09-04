//
//  ListArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI
import SwiftData

struct ListContextArtistView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var showPopover: Bool
    
    var addArtist: (Artist) -> Void
    var setArtist: (Artist) -> Void
    
    @State private var searchText: String = ""
    @State private var showAdd: Bool = false
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    @Query private var artists: [Artist]
    
    var body: some View {
        NavigationStack {
            Form {
                List {
                    ForEach(artists.filter {
                        searchText.isEmpty ? true : $0.name.contains(searchText) || $0.surname.contains(searchText) || $0.origin.contains(searchText)
                    }) { artist in
                        Button(action: {
                            self.showPopover = false
                            setArtist(artist)
                        }) {
                            HStack {
                                Text(artist.surname + " " + artist.name)
                                Spacer()
                                Text(artist.origin)
                            }
                        }
                    }.onDelete(perform: deleteArtist)
                }
            }
            .navigationBarTitle("Add Artist", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.showAdd = true
            }) {
                Label("", systemImage: "plus")
            }.padding())
            .navigationBarItems(trailing: Button("Cancel") {
                self.showPopover = false
            }.padding())
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        }
        .sheet(isPresented: $showAdd) {
            NavigationStack {
                AddOrEditArtistView(options: AddOrEditOptions(value: Artist(surname: "", name: "", origin: ""), showPopover: { value in
                    showAdd = value
                }, addAfter: true, addValue: { artist in
                    addArtist(artist)
                }) { value in
                    value.name.isEmpty
                })
            }
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
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

