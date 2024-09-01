//
//  AddOrEditCreditView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI

struct AddOrEditCreditView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Bindable var credit: Credit
    
    @Binding var showPopover: Bool
    
    var addAfter: Bool
    
    var addCredit: (Credit) -> Void
    
    @State private var showListArtist: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Role", text: $credit.role)
                    TextField("Note", text: $credit.note)
                    if credit.artist == nil {
                        Button("Select Artist", systemImage: "plus", action: { showListArtist = true })
                    } else {
                        HStack {
                            Text(credit.artist!.surname + " " + credit.artist!.name)
                            Spacer()
                            Text(credit.artist!.origin)
                            Spacer()
                            Button(action: {
                                credit.artist = nil
                            }) {
                                Image(systemName: "trash")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle((addAfter ? "Add New" : "Edit") + " Credit", displayMode: .inline)
            .if(addAfter) { view in
                view.toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            addCredit(credit)
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
            .sheet(isPresented: $showListArtist) {
                ListArtistView(showPopover: $showListArtist, addArtist: { artist in
                    modelContext.insert(artist)
                }, setArtist: { artist in
                    credit.artist = artist
                })
            }
        }
    }
}
