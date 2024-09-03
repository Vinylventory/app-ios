//
//  AddOrEditCreditView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditCreditView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @StateObject var options: AddOrEditOptions<Credit>
    
    @State private var showListArtist: Bool = false
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Role", text: $options.value.role)
                    TextField("Note", text: $options.value.note)
                    if options.value.artist == nil {
                        Button("Select Artist", systemImage: "plus", action: { showListArtist = true })
                    } else {
                        HStack {
                            Text(options.value.artist!.surname + " " + options.value.artist!.name)
                            Spacer()
                            Text(options.value.artist!.origin)
                            Spacer()
                            Button(action: {
                                options.value.artist = nil
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .sheet(isPresented: $showListArtist) {
                ListContextArtistView(showPopover: $showListArtist, addArtist: { artist in
                    modelContext.insert(artist)
                }, setArtist: { artist in
                    options.value.artist = artist
                })
            }
        }
    }
}
