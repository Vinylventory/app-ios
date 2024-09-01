//
//  ContentView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var path = NavigationPath()
    
    @State private var sortOrder = [SortDescriptor(\Vinyl.catNumber)]
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack(path: $path) {
            ListVinylView(searchString: searchText, sortOrder: sortOrder)
            .navigationTitle("Vinylventory")
            .navigationDestination(for: Vinyl.self) { vinyl in
                AddOrEditVinylView(vinyl: vinyl, navigationPath: $path, add: true)
            }
            .navigationDestination(for: EditVinyl.self) { editVinyl in
                AddOrEditVinylView(vinyl: editVinyl.vinyl, navigationPath: $path, add: false)
            }
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
            .searchable(text: $searchText)
        }
    }
    
    func addVinyl() {
        let vinyl = Vinyl(catNumber: "", dateCreated: .now, dateReleased: nil, dateEdited: nil, notePocket: "", pressingLoc: "", edition: "", weight: 0, rank: 0, notes: "", playedBy: [], authored: [], credits: [], album: nil, label: nil, tracks: [], bought: nil, pocketState: nil, state: nil, readSpeed: .s78)
        path.append(vinyl)
    }
}

#Preview {
    do {
        let previewer = try Previewer()

        return ContentView()
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
