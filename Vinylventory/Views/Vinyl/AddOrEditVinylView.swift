//
//  EditVinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import SwiftUI
import SwiftData
import PhotosUI

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
    
    @State private var showImageContext: Bool = false
    @State private var selectedImage: UIImage? = nil
    
    
    
    @State private var isPresentingPicker = false
    @State private var isPresentingCamera = false
    @State var showActionSheet = false
    
    @State private var imageImported: PhotosPickerItem? = nil
    
    @State private var error: Bool = false
    @State private var errorMessage: String = ""
    
    
    
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
            
            VinylMultipleAdd(list: $vinyl.playedBy, title: "Played By", button: "Add Musician", addButton: {
                playedBy = true
                showListArtist = true
            }) { value in
                HStack {
                    Text(value.surname + " " + value.name)
                    Spacer()
                    Text(value.origin)
                }
            }
            
            VinylMultipleAdd(list: $vinyl.authored, title: "Authored By", button: "Add Author", addButton: {
                playedBy = false
                showListArtist = true
            }) { value in
                HStack {
                    Text(value.surname + " " + value.name)
                    Spacer()
                    Text(value.origin)
                }
            }
            
            VinylMultipleAdd(list: $vinyl.credits, title: "Credits", button: "Add Credit", addButton: {
                showAddCredit = true
            }) { value in
                HStack {
                    if value.artist != nil {
                        Text(value.artist!.surname + " " + value.artist!.name)
                    } else {
                        Text("")
                    }
                    Spacer()
                    Text(value.role)
                }
            }
            
            VinylSingleAdd(value: $vinyl.album, title: "Album", button: "Add Album", addButton: {
                showListAlbum = true
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
            
            VinylSingleAdd(value: $vinyl.label, title: "Label", button: "Add Label", addButton: {
                showListLabel = true
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
            
            VinylMultipleAdd(list: $vinyl.tracks, title: "Tracks", button: "Add Track", addButton: {
                showAddTrack = true
            }) { value in
                HStack {
                    Text(value.name)
                    if value.duration != nil {
                        Spacer()
                        Text(String(value.duration!))
                    }
                }
            }
            
            VinylSingleAdd(value: $vinyl.label, title: "v", button: "Add Purchase Informations", addButton: {
                showListBought = true
            }) {
                HStack {
                    Text(vinyl.bought!.loc)
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
            
            VinylImageList(vinyl: vinyl, showImageContext: $showImageContext)
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
            ListContextAlbumView(showPopover: $showListAlbum, addAlbum: { album in
                modelContext.insert(album)
            }, setAlbum: { album in
                vinyl.album = album
            })
        }
        .sheet(isPresented: $showListLabel) {
            ListContextLabelView(showPopover: $showListLabel, addLabel: { label in
                modelContext.insert(label)
            }, setLabel: { label in
                vinyl.label = label
            })
        }
        .sheet(isPresented: $showListBought) {
            ListContextBoughtView(showPopover: $showListBought, addBought: { bought in
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
            NavigationStack {
                AddOrEditCreditView(options: AddOrEditOptions(value: Credit(role: "", note: ""), showPopover: { value in
                    showAddCredit = value
                }, addAfter: true) { credit in
                    modelContext.insert(credit)
                    if vinyl.credits == nil {
                        vinyl.credits = []
                    }
                    vinyl.credits!.append(credit)
                })
            }
        }
        .sheet(isPresented: $showAddTrack) {
            NavigationStack {
                AddOrEditTrackView(options: AddOrEditOptions(value: Track(name: "", duration: nil), showPopover: { value in
                    showAddTrack = value
                }, addAfter: true) { track in
                    modelContext.insert(track)
                    if vinyl.tracks == nil {
                        vinyl.tracks = []
                    }
                    vinyl.tracks!.append(track)
                })
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
        .actionSheet(isPresented: $showImageContext) {
            ActionSheet(
                title: Text("Select Image"),
                message: Text("Choose an image from your library or take a new photo"),
                buttons: [
                    .default(Text("Photo Library")) {
                        isPresentingPicker = true
                    },
                    .default(Text("Camera")) {
                        isPresentingCamera = true
                    },
                    .cancel()
                ]
            )
        }
        .photosPicker(isPresented: $isPresentingPicker, selection: $imageImported)
        .sheet(isPresented: $isPresentingCamera) {
            ImagePicker(sourceType: .camera, selectedImage: $selectedImage)
        }
        .onChange(of: imageImported) {
            Task {
                if imageImported != nil {
                    do {
                        if let data = try await imageImported!.loadTransferable(type: Data.self) {
                            selectedImage = UIImage(data: data)
                        }
                    } catch {
                        self.error = true
                        errorMessage = error.localizedDescription
                    }
                }
            }
        }
        .modifier(ErrorAlertModifier(isPresented: $error, errorMessage: errorMessage))
    }
}
