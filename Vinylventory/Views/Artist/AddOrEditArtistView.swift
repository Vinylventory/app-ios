//
//  AddOrEditArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditArtistView: View {
    
    @Bindable var artist: Artist
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addArtist: (Artist) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Surname", text: $artist.surname)
                    TextField("Name", text: $artist.name)
                    TextField("Origin", text: $artist.origin)
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Artist", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addArtist(artist)
                            self.showPopover = false
                        }) {
                            Label("", systemImage: "plus")
                        }.padding()
                    }
                }
            }
            .navigationBarItems(trailing: Button("Cancel") {
                self.showPopover = false
            }.padding())
        }
    }
}
