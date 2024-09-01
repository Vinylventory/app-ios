//
//  EditAlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 30.08.2024.
//

import SwiftUI

struct AddOrEditAlbumView: View {
    
    @Bindable var album: Album
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addAlbum: (Album) -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $album.name)
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Album", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addAlbum(album)
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
