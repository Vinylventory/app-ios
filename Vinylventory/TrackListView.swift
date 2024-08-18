//
//  ArtistListView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 16.08.2024.
//

import SwiftUI

struct TrackListView: View {
    @State private var showAddTrackForm: Bool = false
    @State private var searchText: String = ""
    @Binding var tracks: [Network.Track]
    
    var body: some View {
        Section(header: Text("Tracks")) {
            ForEach(tracks.indices, id: \.self) { index in
                VStack(alignment: .leading) {
                    Text("Name: \(tracks[index].name)")
                    Text("Duration: \(tracks[index].duration)")
                }
                .swipeActions {
                    Button(role: .destructive) {
                        tracks.remove(at: index)
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            Button(action: {
                self.showAddTrackForm = true
            }) {
                Label("Add Track", systemImage: "plus")
            }
            .sheet(isPresented: $showAddTrackForm) {
                AddTrackFormView(tracks: $tracks, isPresented: $showAddTrackForm)
            }
        }
    }
}

struct AddTrackFormView: View {
    @Binding var tracks: [Network.Track]
    @Binding var isPresented: Bool
    
    @State private var name = ""
    @State private var duration = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Track Details")) {
                    TextField("Name", text: $name)
                    TextField("Duration", value: $duration, formatter: NumberFormatter())
                }
                Button("Add Track") {
                    let newTrack = Network.Track(name: name, duration: duration)
                    tracks.append(newTrack)
                    isPresented = false
                }
                .disabled(name.isEmpty)
            }
            .navigationBarTitle("New Track", displayMode: .inline)
            .navigationBarItems(trailing: Button("Cancel") {
                isPresented = false
            })
        }
    }
}

#Preview {
    TrackListView(tracks: .constant([]))
}
