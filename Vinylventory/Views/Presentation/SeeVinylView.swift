//
//  SeeVinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 02.09.2024.
//

import SwiftUI

struct SeeVinylView: View {
    
    @Bindable var vinyl: Vinyl
    
    var body: some View {
        Form {
            Section(header: Text("Vinyl Information")) {
                HStack {
                    Text("Cart Number")
                    Spacer()
                    Text(vinyl.catNumber)
                }
                
                HStack {
                    Text("Date Released")
                    Spacer()
                    Text(vinyl.dateReleased != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: vinyl.dateReleased!) : "N/A")
                }
                
                HStack {
                    Text("Date Edited")
                    Spacer()
                    Text(vinyl.dateEdited != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: vinyl.dateEdited!) : "N/A")
                }
                
                HStack {
                    Text("Note Pocket")
                    Spacer()
                    Text(vinyl.notePocket)
                }
                
                HStack {
                    Text("Pressing Location")
                    Spacer()
                    Text(vinyl.pressingLoc)
                }
                
                HStack {
                    Text("Edition")
                    Spacer()
                    Text(vinyl.edition)
                }
                
                HStack {
                    Text("Weight")
                    Spacer()
                    Text("\(vinyl.weight ?? 0, specifier: "%.2f")")
                }
                
                HStack {
                    Text("Rank")
                    Spacer()
                    Text("\(vinyl.rank ?? 0)")
                }
                
                HStack {
                    Text("Notes")
                    Spacer()
                    Text(vinyl.notes)
                }
            }
            
            Section(header: Text("Played By")) {
                if let playedBy = vinyl.playedBy, !playedBy.isEmpty {
                    ForEach(playedBy) { artist in
                        HStack {
                            Text(artist.surname + " " + artist.name)
                            Spacer()
                            Text(artist.origin)
                        }
                    }
                } else {
                    Text("No musicians listed.")
                }
            }
            
            Section(header: Text("Authored By")) {
                if let authored = vinyl.authored, !authored.isEmpty {
                    ForEach(authored) { artist in
                        HStack {
                            Text(artist.surname + " " + artist.name)
                            Spacer()
                            Text(artist.origin)
                        }
                    }
                } else {
                    Text("No authors listed.")
                }
            }
            
            Section(header: Text("Credits")) {
                if let credits = vinyl.credits, !credits.isEmpty {
                    ForEach(credits) { credit in
                        HStack {
                            Text(credit.artist?.surname ?? "" + " " + (credit.artist?.name ?? ""))
                            Spacer()
                            Text(credit.role)
                        }
                    }
                } else {
                    Text("No credits listed.")
                }
            }
            
            Section(header: Text("Album")) {
                if let album = vinyl.album {
                    HStack {
                        Text(album.name)
                    }
                } else {
                    Text("No album listed.")
                }
            }
            
            Section(header: Text("Label")) {
                if let label = vinyl.label {
                    HStack {
                        Text(label.name)
                    }
                } else {
                    Text("No label listed.")
                }
            }
            
            Section(header: Text("Tracks")) {
                if let tracks = vinyl.tracks, !tracks.isEmpty {
                    ForEach(tracks) { track in
                        HStack {
                            Text(track.name)
                            if let duration = track.duration {
                                Spacer()
                                Text("\(duration)")
                            }
                        }
                    }
                } else {
                    Text("No tracks listed.")
                }
            }
            
            Section(header: Text("Purchase Information")) {
                if let bought = vinyl.bought {
                    HStack {
                        Text(bought.loc)
                        Spacer()
                        Text(bought.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: bought.date!) : "N/A")
                    }
                } else {
                    Text("No purchase information available.")
                }
            }
            
            Section(header: Text("State & Other Information")) {
                HStack {
                    Text("Pocket State")
                    Spacer()
                    Text(vinyl.pocketState?.description ?? "None")
                }
                
                HStack {
                    Text("State")
                    Spacer()
                    Text(vinyl.state?.description ?? "None")
                }
                
                HStack {
                    Text("Read Speed")
                    Spacer()
                    Text(vinyl.readSpeed?.description ?? "None")
                }
            }
        }
        .navigationTitle("Vinyl " + vinyl.catNumber)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: EditVinyl(vinyl: vinyl))  {
                    Label("", systemImage: "pencil")
                }.padding()
            }
        }
    }
}
