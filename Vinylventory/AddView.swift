//
//  AddView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI
import VinylventoryAPI

struct AddView: View {
    @State private var cartNumber = ""
    @State private var dateReleased: Date = .now
    @State private var dateEdited: Date = .now
    @State private var notePocket = ""
    @State private var pressingLoc = ""
    @State private var edition = ""
    @State private var weight = 0
    @State private var rank = 0
    @State private var notes = ""
    
    @State private var artistsAvailable: [Network.Artist] = []
    @State private var playedBys: [Network.Artist] = []
    @State private var authoreds: [Network.Artist] = []
    @State private var credits: [Network.Credit] = []
    
    @State private var album = ""
    @State private var label = ""
    @State private var tracks: [Network.Track] = []
    
    @State private var locBought = ""
    @State private var dateBought: Date = .now
    @State private var priceBought = 0
    @State private var noteBought = ""
    
    @State private var pocketState = ""
    @State private var state = ""
    @State private var readSpeed = ""
    @State private var images: [UIImage] = []

    @State private var pocketStates: [String] = []
    @State private var states: [String] = []
    @State private var readSpeeds: [String] = []
    
    @State private var showingErrorAlert: Bool = false
    @State private var error: String = ""
    
    @State private var showFinished: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        Form {
            Section(header: Text("Vinyl Information")) {
                TextField("Cart Number", text: $cartNumber)
                DatePicker("Date Released", selection: $dateReleased, displayedComponents: .date).foregroundStyle(.gray)
                DatePicker("Date Edited", selection: $dateEdited, displayedComponents: .date).foregroundStyle(.gray)
                TextField("Note Pocket", text: $notePocket)
                TextField("Pressing Location", text: $pressingLoc)
                TextField("Edition", text: $edition)
                HStack {
                    Text("Weight").foregroundStyle(.gray)
                    TextField("Enter Weight", value: $weight, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Rank").foregroundStyle(.gray)
                    TextField("Enter Rank", value: $rank, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                TextField("Notes", text: $notes)
            }
            
            ArtistListView(title: "Played By", artists: $playedBys, artistsAvailable: $artistsAvailable)
            ArtistListView(title: "Authored By", artists: $authoreds, artistsAvailable: $artistsAvailable)
            CreditListView(credits: $credits, artistsAvailable: $artistsAvailable)
            
            Section(header: Text("Album & Label")) {
                TextField("Album", text: $album)
                TextField("Label", text: $label)
            }
            
            TrackListView(tracks: $tracks)
            
            Section(header: Text("Purchase Information")) {
                TextField("Location Bought", text: $locBought)
                DatePicker("Date Bought", selection: $dateBought, displayedComponents: .date).foregroundStyle(.gray)
                HStack {
                    Text("Price Bought").foregroundStyle(.gray)
                    TextField("Enter Price", value: $priceBought, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                TextField("Note Bought", text: $noteBought)
            }
            
            Section(header: Text("State & Other Information")) {
                Picker("Pocket State", selection: $pocketState) {
                    ForEach(pocketStates, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
                Picker("State", selection: $state) {
                    ForEach(states, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
                Picker("Read Speed", selection: $readSpeed) {
                    ForEach(readSpeeds, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
            }
            
            ImageListView(images: $images)
            
            Button(action: saveVinyl) {
                Text("Save Vinyl")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .buttonStyle(DefaultButtonStyle())
            .disabled(cartNumber.isEmpty || readSpeed.isEmpty)
        }
        .navigationBarTitle("Add Vinyl", displayMode: .large)
        .onAppear {
            Network.shared.fetchPocketStates { result in
                switch result {
                case .success(let pocketStates):
                    self.pocketStates = pocketStates.map {$0.name}
                    self.pocketState = self.pocketStates[0]
                case .failure(let error):
                    print("Error fetching pocket states: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    self.showingErrorAlert = true
                }
            }
            Network.shared.fetchStates { result in
                switch result {
                case .success(let states):
                    self.states = states.map {$0.name}
                    self.state = self.states[0]
                case .failure(let error):
                    print("Error fetching states: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    self.showingErrorAlert = true
                }
            }
            Network.shared.fetchReadSpeed { result in
                switch result {
                case .success(let readSpeeds):
                    self.readSpeeds = readSpeeds.map {$0.speed}
                    self.readSpeed = self.readSpeeds[0]
                case .failure(let error):
                    print("Error fetching read speed: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    self.showingErrorAlert = true
                }
            }
            Network.shared.fetchArtists { result in
                switch result {
                case .success(let artists):
                    self.artistsAvailable = artists.map {Network.Artist(surname: $0.surname ?? "", name: $0.name, origin: $0.origin)}
                case .failure(let error):
                    print("Error fetching pocket states: \(error.localizedDescription)")
                    self.error = error.localizedDescription
                    self.showingErrorAlert = true
                }
            }
        }
        .alert(
            "Error fetching things",
            isPresented: $showingErrorAlert,
            presenting: error
        ) { error in
            Button(role: .destructive) {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Go Back")
            }
        } message: { error in
            Text("\(error)")
        }
        .alert(
            "Vinyl saved!",
            isPresented: $showFinished
        ) {
            Button("OK") {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    func saveVinyl() {
        
        Network.shared.createVinyl(
            cartNumber: cartNumber,
            dateReleased: dateReleased.ISO8601Format(),
            dateEdited: dateEdited.ISO8601Format(),
            notePocket: notePocket,
            pressingLoc: pressingLoc,
            edition: edition,
            weight: weight,
            rank: rank,
            notes: notes,
            playedBys: playedBys,
            authoreds: authoreds,
            credits: credits,
            album: album,
            label: label,
            tracks: tracks,
            locBought: locBought,
            dateBought: dateBought.ISO8601Format(),
            priceBought: priceBought,
            noteBought: noteBought,
            pocketState: pocketState,
            state: state,
            readSpeed: readSpeed
        ) { result in
            switch result {
            case .success(let idVinyl):
                
                if (!idVinyl.isEmpty) {
                    for image in images {
                        Network.shared.uploadImage(image, idVinyl: idVinyl) { result in
                            switch result {
                            case .success(_):
                                self.showFinished = true
                                break
                            case .failure(let error):
                                print("Error uploading image for vinyl \(idVinyl): \(error.localizedDescription)")
                                self.error = error.localizedDescription
                                self.showingErrorAlert = true
                                return
                            }
                        }
                    }
                    if (images.isEmpty) {
                        self.showFinished = true
                    }
                }
            case .failure(let error):
                print("Error creating vinyl: \(error.localizedDescription)")
                self.error = error.localizedDescription
                self.showingErrorAlert = true
                return
            }
        }
    }
}

#Preview {
    AddView()
}
