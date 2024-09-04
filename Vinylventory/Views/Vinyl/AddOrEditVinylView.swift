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
    
    @State private var showImageContext: Bool = false
    @State private var selectedImage: UIImage? = nil
    
    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                TextField("Identifier", text: $vinyl.catNumber)
                
                DatePickerOptional(title: "Date Released", displayedComponents: .date, selection: $vinyl.dateReleased)
                
                DatePickerOptional(title: "Date Edited", displayedComponents: .date, selection: $vinyl.dateEdited)
                
                TextField("Edition", text: $vinyl.edition)
                TextField("Note about Pocket", text: $vinyl.notePocket)
                TextField("Pressing Location", text: $vinyl.pressingLoc)
                
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
                TextField("Note about the vinyl", text: $vinyl.notes)
            }
            
            VinylMultipleAdd(list: $vinyl.playedBy, title: "Played By", button: "Add Musician", sheet: { value in
                ListContextArtistView(showPopover: value, addArtist: { artist in
                    modelContext.insert(artist)
                }, setArtist: { artist in
                    if vinyl.playedBy == nil {
                        vinyl.playedBy = []
                    }
                    vinyl.playedBy!.append(artist)
                })
            }) { value in
                HStack {
                    Text("\(value.surname) \(value.name)")
                    Spacer()
                    Text(value.origin)
                }
            }
            
            VinylMultipleAdd(list: $vinyl.authored, title: "Authored By", button: "Add Author", sheet: { value in
                ListContextArtistView(showPopover: value, addArtist: { artist in
                    modelContext.insert(artist)
                }, setArtist: { artist in
                    if vinyl.authored == nil {
                        vinyl.authored = []
                    }
                    vinyl.authored!.append(artist)
                })
            }) { value in
                HStack {
                    Text("\(value.surname) \(value.name)")
                    Spacer()
                    Text(value.origin)
                }
            }
            
            VinylMultipleAdd(list: $vinyl.credits, title: "Credits", button: "Add Credit", sheet: { value in
                NavigationStack {
                    AddOrEditCreditView(options: AddOrEditOptions(value: Credit(role: "", note: ""), showPopover: { v in
                        value.wrappedValue = v
                    }, addAfter: true, addValue: { credit in
                        modelContext.insert(credit)
                        if vinyl.credits == nil {
                            vinyl.credits = []
                        }
                        vinyl.credits!.append(credit)
                    }) { value in
                        value.role.isEmpty && value.artist == nil
                    })
                }
            }) { value in
                HStack {
                    if value.artist != nil {
                        Text("\(value.artist!.surname) \(value.artist!.name)")
                    } else {
                        Text("")
                    }
                    Spacer()
                    Text(value.role)
                }
            }
            
            VinylSingleAdd(value: $vinyl.album, title: "Album", button: "Add Album", sheet: { value in
                ListContextAlbumView(showPopover: value, addAlbum: { album in
                    modelContext.insert(album)
                }, setAlbum: { album in
                    vinyl.album = album
                })
            }) {
                HStack {
                    Text(vinyl.album!.name)
                    Spacer()
                    Button(action: {
                        vinyl.album = nil
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            
            VinylSingleAdd(value: $vinyl.label, title: "Label", button: "Add Label", sheet: { value in
                ListContextLabelView(showPopover: value, addLabel: { label in
                    modelContext.insert(label)
                }, setLabel: { label in
                    vinyl.label = label
                })
            }) {
                HStack {
                    Text(vinyl.label!.name)
                    Spacer()
                    Button(action: {
                        vinyl.label = nil
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            VinylMultipleAdd(list: $vinyl.tracks, title: "Tracks", button: "Add Track", sheet: { value in
                NavigationStack {
                    AddOrEditTrackView(options: AddOrEditOptions(value: Track(name: "", duration: nil), showPopover: { v in
                        value.wrappedValue = v
                    }, addAfter: true, addValue: { track in
                        modelContext.insert(track)
                        if vinyl.tracks == nil {
                            vinyl.tracks = []
                        }
                        vinyl.tracks!.append(track)
                    }) { value in
                        value.name.isEmpty
                    })
                }
            }) { value in
                HStack {
                    Text(value.name)
                    if value.duration != nil {
                        Spacer()
                        Text(String(value.duration!))
                    }
                }
            }
            
            VinylSingleAdd(value: $vinyl.bought, title: "Purchase Informations", button: "Add Purchase Informations", sheet: { value in
                ListContextBoughtView(showPopover: value, addBought: { bought in
                    modelContext.insert(bought)
                }, setBought: { bought in
                    vinyl.bought = bought
                })
            }) {
                HStack {
                    Text(vinyl.bought!.loc)
                    Spacer()
                    Text(vinyl.bought!.date != nil ? DateFormatter().apply {$0.dateStyle = .short} .string(from: vinyl.bought!.date!) : "N/A")
                    Spacer()
                    Button(action: {
                        vinyl.bought = nil
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            
            Section(header: Text("State & Other Informations")) {
                Picker("Pocket State", selection: $vinyl.pocketState) {
                    Text("None")
                        .tag(Optional<PocketState>.none)
                    Divider()
                    ForEach(PocketState.allCases) { state in
                        Text(state.description).tag(Optional(state))
                    }
                }
                Picker("Vinyl State", selection: $vinyl.state) {
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
            
            VinylImageList(vinyl: vinyl, showImageContext: $showImageContext, selectedImage: $selectedImage)
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
                    }
                    .padding()
                    .disabled(vinyl.catNumber.isEmpty)
                }
            }
        }
        .onChange(of: selectedImage) {
            if selectedImage != nil {
                let image = ImageModel(data: selectedImage!.pngData())
                modelContext.insert(image)
                if vinyl.images == nil {
                    vinyl.images = []
                }
                vinyl.images!.append(image)
            }
        }
    }
}
