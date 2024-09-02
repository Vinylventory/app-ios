//
//  AddOrEditArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditArtistView: View {
    
    @Bindable var artist: Artist
    
    var showPopover: (Bool) -> Void
    
    var addAfter: Bool
    
    var addArtist: (Artist) -> Void
    
    var revertButtons: Bool = false
    
    var placement: ToolbarItemPlacement {
        return !revertButtons ? .topBarLeading : .topBarTrailing
    }
    
    var displayMode: NavigationBarItem.TitleDisplayMode {
        return !revertButtons ? .inline : .large
    }
    
    var body: some View {
        Form {
            Section(header: Text("Details")) {
                TextField("Surname", text: $artist.surname)
                TextField("Name", text: $artist.name)
                TextField("Origin", text: $artist.origin)
            }
        }
        .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Artist", displayMode: displayMode)
        .if(addAfter) { view in
            view.toolbar {
                ToolbarItem(placement: placement) {
                    Button(action: {
                        addArtist(artist)
                        showPopover(false)
                    }) {
                        Label("", systemImage: "plus")
                    }.padding()
                }
            }
        }
        .if(!revertButtons) { view in
            view.navigationBarItems(trailing: Button("Cancel") {
                showPopover(false)
            }.padding())
        }
    }
}
