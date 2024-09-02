//
//  VinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 01.09.2024.
//

import SwiftUI
import SwiftData

struct VinylView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Binding var path: NavigationPath
    
    @State private var sortOrder = [SortDescriptor(\Vinyl.catNumber)]
    @State private var searchText = ""
    
    var body: some View {
        ListVinylView(searchString: searchText, sortOrder: sortOrder)
        .navigationBarTitle("Vinyl List", displayMode: .large)
        .toolbar {
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Cat Number (A-Z)")
                        .tag([SortDescriptor(\Vinyl.catNumber)])
                    
                    Text("Cat Number (Z-A)")
                        .tag([SortDescriptor(\Vinyl.catNumber, order: .reverse)])
                }
            }
            
            Button("Add Vinyl", systemImage: "plus", action: addVinyl)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
    
    func addVinyl() {
        let vinyl = Vinyl(catNumber: "", dateCreated: .now, dateReleased: nil, dateEdited: nil, notePocket: "", pressingLoc: "", edition: "", weight: 0, rank: 0, notes: "", playedBy: [], authored: [], credits: [], album: nil, label: nil, tracks: [], bought: nil, pocketState: nil, state: nil, readSpeed: .s78)
        path.append(vinyl)
    }
}
