//
//  ListAlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 30.08.2024.
//

import SwiftUI
import SwiftData

struct ListAlbumView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var showPopover: Bool
    
    var addAlbum: (Album) -> Void
    var setAlbum: (Album) -> Void
    
    @State private var searchText: String = ""
    @State private var showAdd: Bool = false
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    @Query private var albums: [Album]
    
    var body: some View {
        NavigationView {
            Form {
                List {
                    ForEach(albums.filter {
                        searchText.isEmpty ? true : $0.name.contains(searchText)
                    }) { album in
                        Button(action: {
                            self.showPopover = false
                            setAlbum(album)
                        }) {
                            HStack {
                                Text(album.name)
                                Spacer()
                                Text((album.vinyls != nil ? String(album.vinyls!.count) : "0") + " vinyl" + (album.vinyls != nil && album.vinyls!.count > 1 ? "s" : ""))
                                    .foregroundStyle(.gray)
                            }
                        }
                    }.onDelete(perform: deleteAlbum)
                }
            }
            .navigationBarTitle("Add Album", displayMode: .inline)
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
            AddOrEditAlbumView(album: Album(name: ""), showPopover: $showAdd, addAfter: true) { album in
                addAlbum(album)
            }
        }
        .alert("Error", isPresented: $error) {
            Button("OK") { }
        } message: {
            Text(errorMessage)
        }
    }
    
    func deleteAlbum(at offsets: IndexSet) {
        for offset in offsets {
            let album = albums[offset]
            if album.vinyls == nil || album.vinyls!.isEmpty {
                modelContext.delete(album)
            } else {
                errorMessage = "You can't delete this album because there is vinyls attached to him."
                error = true
            }
        }
    }
}

#Preview {
    ListAlbumView(showPopover: .constant(true), addAlbum: {album in}, setAlbum: {album in})
}
