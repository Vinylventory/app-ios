//
//  ArtistListView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 16.08.2024.
//

import SwiftUI

struct ArtistListView: View {
    let title: String
    var single: Bool = false
    @State private var showPopover: Bool = false
    @State private var showAddArtistForm: Bool = false
    @State private var searchText: String = ""
    
    @Binding var artists: [Network.Artist]
    @Binding var artistsAvailable: [Network.Artist]
    
    var body: some View {
        Section(header: Text(title)) {
            ForEach(artists.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("Surname: \(artists[index].surname)")
                    Text("Name: \(artists[index].name)")
                    Text("Origin: \(artists[index].origin)")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        artists.remove(at: index)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            Button(action: {
                self.showPopover = true
            }) {
                Label("Add Artist", systemImage: "plus")
            }
            .disabled(artists.count > 0 && single)
            .sheet(isPresented: $showPopover) {
                NavigationView {
                    Form {
                        List {
                            ForEach(artistsAvailable.filter {
                                searchText.isEmpty ? true : $0.name.contains(searchText) || $0.surname.contains(searchText)
                            }) { artist in
                                Button(action: {
                                    artists.append(artist)
                                    self.showPopover = false
                                }) {
                                    HStack {
                                        Text(artist.name)
                                        Text(artist.surname)
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Add Artist", displayMode: .inline)
                    .navigationBarItems(leading: Button(action: {
                        self.showPopover = false
                        self.showAddArtistForm = true
                    }) {
                        Label("", systemImage: "person.crop.circle.badge.plus")
                    }.padding())
                    .navigationBarItems(trailing: Button("Cancel") {
                        self.showPopover = false
                    }.padding())
                    .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                }
            }
            .sheet(isPresented: $showAddArtistForm) {
                AddArtistFormView(artists: $artists, artistsAvailable: $artistsAvailable, isPresented: $showAddArtistForm)
            }
        }
    }
}

struct AddArtistFormView: View {
    @Binding var artists: [Network.Artist]
    @Binding var artistsAvailable: [Network.Artist]
    @Binding var isPresented: Bool
    
    @State private var surname = ""
    @State private var name = ""
    @State private var origin = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Artist Details")) {
                    TextField("Surname", text: $surname)
                    TextField("Name", text: $name)
                    TextField("Origin", text: $origin)
                }
                Button("Add Artist") {
                    let newArtist = Network.Artist(surname: surname, name: name, origin: origin)
                    artists.append(newArtist)
                    artistsAvailable.append(newArtist)
                    isPresented = false
                }
                .disabled(surname.isEmpty || name.isEmpty || origin.isEmpty)
            }
            .navigationBarTitle("New Artist", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
}

#Preview {
    ArtistListView(title: "Add Artist", artists: .constant([]), artistsAvailable: .constant([]))
}
