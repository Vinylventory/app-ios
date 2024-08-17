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
    @State private var dateReleased = ""
    @State private var dateEdited = ""
    @State private var notePocket = ""
    @State private var pressingLoc = ""
    @State private var edition = ""
    @State private var weight = 0
    @State private var rank = 0
    @State private var notes = ""
    
    @State private var playedBys: [Network.Artist] = []
    @State private var authoreds: [Network.Artist] = []
    @State private var credits: [Network.Credit] = []
    
    @State private var album = ""
    @State private var label = ""
    @State private var tracks: [Network.Track] = []
    
    @State private var locBought = ""
    @State private var dateBought = ""
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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Vinyl Information")) {
                    TextField("Cart Number", text: $cartNumber)
                    TextField("Date Released", text: $dateReleased)
                    TextField("Date Edited", text: $dateEdited)
                    TextField("Note Pocket", text: $notePocket)
                    TextField("Pressing Location", text: $pressingLoc)
                    TextField("Edition", text: $edition)
                    HStack {
                        Text("Weight").foregroundStyle(.gray)
                        TextField("Enter Weight", value: $priceBought, formatter: NumberFormatter())
                            .keyboardType(.decimalPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("Rank").foregroundStyle(.gray)
                        TextField("Enter Rank", value: $priceBought, formatter: NumberFormatter())
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    TextField("Notes", text: $notes)
                }
                
                ArtistListView(title: "Played By", artists: $playedBys)
                ArtistListView(title: "Authored By", artists: $authoreds)
                CreditListView(credits: $credits)
                
                Section(header: Text("Album & Label")) {
                    TextField("Album", text: $album)
                    TextField("Label", text: $label)
                }
                
                TrackListView(tracks: $tracks)
                
                Section(header: Text("Purchase Information")) {
                    TextField("Location Bought", text: $locBought)
                    TextField("Date Bought", text: $dateBought)
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
            .navigationBarTitle("Add Vinyl", displayMode: .inline)
        }
        .onAppear {
            Network.shared.fetchPocketStates { result in
                switch result {
                case .success(let pocketStates):
                    self.pocketStates = pocketStates.map {$0.name}
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
                case .failure(let error):
                    print("Error fetching read speed: \(error.localizedDescription)")
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
    }
    
    func saveVinyl() {
        print("Vinyl saved!")
    }
}

#Preview {
    AddView()
}
