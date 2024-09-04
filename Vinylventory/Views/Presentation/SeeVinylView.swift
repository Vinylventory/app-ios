//
//  SeeVinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 02.09.2024.
//

import SwiftUI

struct SeeVinylView: View {
    
    @Bindable var vinyl: Vinyl
    
    @Environment(\.modelContext) var modelContext
    @State private var playedBy: Bool = false
    
    var body: some View {
        Form {
            if vinyl.images != nil && !vinyl.images!.isEmpty {
                TabView {
                    ForEach(vinyl.images!, id: \.self) { image in
                        if let uiImage = UIImage(data: image.data!) {
                            NavigationLink(value: SeeImage(image: uiImage)) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                            }
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .foregroundColor(.gray)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                .frame(height: 300)
            }
            Section(header: Text("Informations")) {
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
                    Text(vinyl.notePocket.isEmpty ? "N/A" : vinyl.notePocket)
                }
                
                HStack {
                    Text("Pressing Location")
                    Spacer()
                    Text(vinyl.pressingLoc.isEmpty ? "N/A" : vinyl.pressingLoc)
                }
                
                HStack {
                    Text("Edition")
                    Spacer()
                    Text(vinyl.edition.isEmpty ? "N/A" : vinyl.edition)
                }
                
                HStack {
                    Text("Weight")
                    Spacer()
                    if vinyl.weight != 0 {
                        Text("\(vinyl.weight, specifier: "%.2f")")
                    } else {
                        Text("N/A")
                    }
                }
                
                HStack {
                    Text("Rank")
                    Spacer()
                    Text(vinyl.rank == 0 ? "N/A" : String(vinyl.rank))
                }
                
                HStack {
                    Text("Notes")
                    Spacer()
                    Text(vinyl.notes.isEmpty ? "N/A" : vinyl.notes)
                }
            }
            
            Section(header: Text("Played By")) {
                if let playedBy = vinyl.playedBy, !playedBy.isEmpty {
                    ForEach(playedBy) { artist in
                        NavigationLink(value: SeeArtist(artist: artist)) {
                            HStack {
                                Text(artist.surname + " " + artist.name)
                                Spacer()
                                Text(artist.origin)
                            }
                        }
                    }
                } else {
                    Text("No musicians listed.")
                }
            }
            
            Section(header: Text("Authored By")) {
                if let authored = vinyl.authored, !authored.isEmpty {
                    ForEach(authored) { artist in
                        NavigationLink(value: SeeArtist(artist: artist)) {
                            HStack {
                                Text(artist.surname + " " + artist.name)
                                Spacer()
                                Text(artist.origin)
                            }
                        }
                    }
                } else {
                    Text("No authors listed.")
                }
            }
            
            Section(header: Text("Credits")) {
                if let credits = vinyl.credits, !credits.isEmpty {
                    ForEach(credits) { credit in
                        NavigationLink(value: SeeArtist(artist: credit.artist!)) {
                            HStack {
                                Text(credit.artist?.surname ?? "" + " " + (credit.artist?.name ?? ""))
                                Spacer()
                                Text(credit.role)
                            }
                        }
                    }
                } else {
                    Text("No credits listed.")
                }
            }
            
            Section(header: Text("Album")) {
                if let album = vinyl.album {
                    NavigationLink(value: SeeAlbum(album: album)) {
                        HStack {
                            Text(album.name)
                        }
                    }
                } else {
                    Text("No album listed.")
                }
            }
            
            Section(header: Text("Label")) {
                if let label = vinyl.label {
                    NavigationLink(value: SeeLabelGroup(labelGroup: label)) {
                        HStack {
                            Text(label.name)
                        }
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
                    NavigationLink(value: SeeBought(bought: bought)) {
                        HStack {
                            Text(bought.loc)
                            Spacer()
                            Text(bought.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: bought.date!) : "N/A")
                        }
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
