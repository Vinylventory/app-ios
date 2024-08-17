//
//  ArtistListView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 16.08.2024.
//

import SwiftUI

struct CreditListView: View {
    @State private var showAddCreditForm: Bool = false
    @State private var searchText: String = ""
    @Binding var credits: [Network.Credit]
    
    var body: some View {
        Section(header: Text("Credits")) {
            ForEach(credits.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("Role: \(credits[index].role)")
                    Text("Artist: \(credits[index].artist.surname) \(credits[index].artist.name)")
                    Text("Note: \(credits[index].note)")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        credits.remove(at: index)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            Button(action: {
                self.showAddCreditForm = true
            }) {
                Label("Add Credit", systemImage: "plus")
            }
            .sheet(isPresented: $showAddCreditForm) {
                AddCreditFormView(credits: $credits, isPresented: $showAddCreditForm)
            }
        }
    }
}

struct AddCreditFormView: View {
    @Binding var credits: [Network.Credit]
    @Binding var isPresented: Bool
    
    @State private var role = ""
    @State private var note = ""
    @State private var artists: [Network.Artist] = []

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Credit Details")) {
                    TextField("Role", text: $role)
                    TextField("Note", text: $note)
                    ArtistListView(title: "Choose Artist", single: true, artists: $artists)
                }
                Button("Add Credit") {
                    let newCredit = Network.Credit(role: role, note: note, artist: artists[0])
                    credits.append(newCredit)
                    isPresented = false
                }
                .disabled(artists.isEmpty)
            }
            .navigationBarTitle("New Credit", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
}

#Preview {
    CreditListView(credits: .constant([]))
}
