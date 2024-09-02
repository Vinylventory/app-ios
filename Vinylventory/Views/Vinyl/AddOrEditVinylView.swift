//
//  EditVinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import SwiftUI
import SwiftData

struct AddOrEditVinylView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @Bindable var vinyl: Vinyl
    
    var add: Bool
    
    @Binding var path: NavigationPath
    
    @State private var showListAlbum: Bool = false
    @State private var showListLabel: Bool = false
    @State private var showListBought: Bool = false
    @State private var showListArtist: Bool = false
    
    @State private var playedBy: Bool = false
    
    @State private var showAddCredit: Bool = false
    @State private var showAddTrack: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Vinyl Information")) {
                TextField("Cart Number", text: $vinyl.catNumber)
                
                DatePickerOptional(title: "Date Released", displayedComponents: .date, selection: $vinyl.dateReleased)
                
                DatePickerOptional(title: "Date Edited", displayedComponents: .date, selection: $vinyl.dateEdited)
                
                TextField("Note Pocket", text: $vinyl.notePocket)
                TextField("Pressing Location", text: $vinyl.pressingLoc)
                TextField("Edition", text: $vinyl.edition)
                HStack {
                    Text("Weight").foregroundStyle(.gray)
                    Spacer()
                    TextField("Enter Weight", value: $vinyl.weight, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                HStack {
                    Text("Rank").foregroundStyle(.gray)
                    Spacer()
                    TextField("Enter Rank", value: $vinyl.rank, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                }
                TextField("Notes", text: $vinyl.notes)
            }
            
            Section(header: Text("Played By")) {
                List {
                    if vinyl.playedBy != nil && !vinyl.playedBy!.isEmpty {
                        ForEach(vinyl.playedBy!) { artist in
                            HStack {
                                Text(artist.surname + " " + artist.name)
                                Spacer()
                                Text(artist.origin)
                            }
                        }
                        .onDelete(perform: { offsets in
                            for offset in offsets {
                                vinyl.playedBy!.remove(at: offset)
                            }
                        })
                    }
                    Button("Add Musician", systemImage: "plus", action: { 
                        playedBy = true
                        showListArtist = true
                    })
                }
            }
            
            Section(header: Text("Authored By")) {
                List {
                    if vinyl.authored != nil && !vinyl.authored!.isEmpty {
                        ForEach(vinyl.authored!) { artist in
                            HStack {
                                Text(artist.surname + " " + artist.name)
                                Spacer()
                                Text(artist.origin)
                            }
                        }
                        .onDelete(perform: { offsets in
                            for offset in offsets {
                                vinyl.authored!.remove(at: offset)
                            }
                        })
                    }
                    Button("Add Author", systemImage: "plus", action: {
                        playedBy = false
                        showListArtist = true
                    })
                }
            }
            
            Section(header: Text("Credits")) {
                List {
                    if vinyl.credits != nil && !vinyl.credits!.isEmpty {
                        ForEach(vinyl.credits!) { credit in
                            HStack {
                                if credit.artist != nil {
                                    Text(credit.artist!.surname + " " + credit.artist!.name)
                                } else {
                                    Text("")
                                }
                                Spacer()
                                Text(credit.role)
                            }
                        }
                        .onDelete(perform: { offsets in
                            for offset in offsets {
                                vinyl.credits!.remove(at: offset)
                            }
                        })
                    }
                    Button("Add Credit", systemImage: "plus", action: {
                        showAddCredit = true
                    })
                }
            }
            
            Section(header: Text("Album")) {
                if vinyl.album == nil {
                    Button("Add Album", systemImage: "plus", action: { showListAlbum = true })
                } else {
                    HStack {
                        Text(vinyl.album?.name ?? "")
                        Spacer()
                        Button(action: {
                            vinyl.album = nil
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section(header: Text("Label")) {
                if vinyl.label == nil {
                    Button("Add Label", systemImage: "plus", action: { showListLabel = true })
                } else {
                    HStack {
                        Text(vinyl.label?.name ?? "")
                        Spacer()
                        Button(action: {
                            vinyl.label = nil
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section(header: Text("Tracks")) {
                List {
                    if vinyl.tracks != nil && !vinyl.tracks!.isEmpty {
                        ForEach(vinyl.tracks!) { track in
                            HStack {
                                Text(track.name)
                                if track.duration != nil {
                                    Spacer()
                                    Text(String(track.duration!))
                                }
                            }
                        }
                        .onDelete(perform: { offsets in
                            for offset in offsets {
                                vinyl.tracks!.remove(at: offset)
                            }
                        })
                    }
                    Button("Add Track", systemImage: "plus", action: {
                        showAddTrack = true
                    })
                }
            }
            
            Section(header: Text("Purchase Information")) {
                if vinyl.bought == nil {
                    Button("Add Purchase Informations", systemImage: "plus", action: { showListBought = true })
                } else {
                    HStack {
                        Text(vinyl.bought?.loc ?? "")
                        Spacer()
                        Text(vinyl.bought!.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: vinyl.bought!.date!) : "")
                        Spacer()
                        Button(action: {
                            vinyl.bought = nil
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            
            Section(header: Text("State & Other Information")) {
                Picker("Pocket State", selection: $vinyl.pocketState) {
                    Text("None")
                        .tag(Optional<PocketState>.none)
                    Divider()
                    ForEach(PocketState.allCases) { state in
                        Text(state.description).tag(Optional(state))
                    }
                }
                Picker("State", selection: $vinyl.state) {
                    Text("None")
                        .tag(Optional<VinylState>.none)
                    Divider()
                    ForEach(VinylState.allCases) { state in
                        Text(state.description).tag(Optional(state))
                    }
                }
                Picker("Read Speed", selection: $vinyl.readSpeed) {
                    ForEach(ReadSpeed.allCases) { speed in
                        Text(speed.description).tag(Optional(speed))
                    }
                }
            }
            
            //ImageListView(images: $images)
        }
        .navigationBarTitle((add ? "Add" : "Edit") + " Vinyl " + vinyl.catNumber, displayMode: .large)
        .if(add) { view in
            view.toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        modelContext.insert(vinyl)
                        path.removeLast()
                    }) {
                        Label("", systemImage: "plus")
                    }.padding()
                }
            }
        }
        .sheet(isPresented: $showListAlbum) {
            ListAlbumView(showPopover: $showListAlbum, addAlbum: { album in
                modelContext.insert(album)
            }, setAlbum: { album in
                vinyl.album = album
            })
        }
        .sheet(isPresented: $showListLabel) {
            ListLabelView(showPopover: $showListLabel, addLabel: { label in
                modelContext.insert(label)
            }, setLabel: { label in
                vinyl.label = label
            })
        }
        .sheet(isPresented: $showListBought) {
            ListBoughtView(showPopover: $showListBought, addBought: { bought in
                modelContext.insert(bought)
            }, setBought: { bought in
                vinyl.bought = bought
            })
        }
        .sheet(isPresented: $showListArtist) {
            ListContextArtistView(showPopover: $showListArtist, addArtist: { artist in
                modelContext.insert(artist)
            }, setArtist: { artist in
                if playedBy {
                    if vinyl.playedBy == nil {
                        vinyl.playedBy = []
                    }
                    vinyl.playedBy!.append(artist)
                } else {
                    if vinyl.authored == nil {
                        vinyl.authored = []
                    }
                    vinyl.authored!.append(artist)
                }
            })
        }
        .sheet(isPresented: $showAddCredit) {
            AddOrEditCreditView(credit: Credit(role: "", note: ""), showPopover: $showAddCredit, addAfter: true) { credit in
                modelContext.insert(credit)
                if vinyl.credits == nil {
                    vinyl.credits = []
                }
                vinyl.credits!.append(credit)
            }
        }
        .sheet(isPresented: $showAddTrack) {
            AddOrEditTrackView(track: Track(name: "", duration: nil), showPopover: $showAddTrack, addAfter: true) { track in
                modelContext.insert(track)
                if vinyl.tracks == nil {
                    vinyl.tracks = []
                }
                vinyl.tracks!.append(track)
            }
        }
    }
}

#Preview {
    do {
        let previewer = try Previewer()

        return AddOrEditVinylView(vinyl: previewer.vinyl, add: false, path: .constant(NavigationPath()))
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
