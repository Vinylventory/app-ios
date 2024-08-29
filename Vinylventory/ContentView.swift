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
            VinylsView()
            .navigationTitle("Vinylventory")
            .navigationDestination(for: Vinyl.self) { vinyl in
                EditVinylView(vinyl: vinyl)
            }
            Menu("Sort", systemImage: "arrow.up.arrow.down") {
                Picker("Sort", selection: $sortOrder) {
                    Text("Name (A-Z)")
                        .tag([SortDescriptor(\Vinyl.catNumber)])

                    Text("Name (Z-A)")
                        .tag([SortDescriptor(\Vinyl.catNumber, order: .reverse)])
                }
            }

            Button("Add Vinyl", systemImage: "plus", action: addVinyl)
            .searchable(text: $searchText)
        }
    }
    
    func addVinyl() {
        let vinyl = Vinyl(catNumber: "", dateCreated: .now, dateReleased: .none, dateEdited: .none, notePocket: "", pressingLoc: "", edition: "", weight: 0, rank: 0, notes: "", playedBy: [], authored: [], credits: [], album: .none, label: .none, tracks: [], bought: .none, pocketState: .none, state: .none, readSpeed: .s78)
        modelContext.insert(vinyl)
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
