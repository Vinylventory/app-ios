//
//  EditVinylView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 29.08.2024.
//

import SwiftUI

struct EditVinylView: View {
    
    @Bindable var vinyl: Vinyl
    
    @State private var released: Bool = false
    @State private var edited: Bool = false
    
    var body: some View {
        Form {
            Section(header: Text("Vinyl Information")) {
                TextField("Cart Number", text: $vinyl.catNumber)
                
                Toggle("Include Date Released", isOn: $released)
                
                if released {
                    DatePicker("Date Released", selection: $vinyl.dateReleased, displayedComponents: .date)
                }
                
                Toggle("Include Date Edited", isOn: $edited)
                
                if edited {
                    DatePicker("Date Edited", selection: $vinyl.dateEdited, displayedComponents: .date)
                }
                
                TextField("Note Pocket", text: $vinyl.notePocket)
                TextField("Pressing Location", text: $vinyl.pressingLoc)
                TextField("Edition", text: $vinyl.edition)
                HStack {
                    Text("Weight").foregroundStyle(.gray)
                    TextField("Enter Weight", value: $vinyl.weight, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Rank").foregroundStyle(.gray)
                    TextField("Enter Rank", value: $vinyl.rank, formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                TextField("Notes", text: $vinyl.notes)
            }
            
            //ArtistListView(title: "Played By", artists: $playedBys, artistsAvailable: $artistsAvailable)
            //ArtistListView(title: "Authored By", artists: $authoreds, artistsAvailable: $artistsAvailable)
            //CreditListView(credits: $credits, artistsAvailable: $artistsAvailable)
            
            /*
            Section(header: Text("Album & Label")) {
                TextField("Album", text: $vinyl.album)
                TextField("Label", text: $vinyl.label)
            }
            */
             
            //TrackListView(tracks: $tracks)
            
            /*Section(header: Text("Purchase Information")) {
                TextField("Location Bought", text: $vinyl.locBought)
                
                Toggle("Include Date Bought", isOn: $bought)
                
                if bought {
                    DatePicker("Date Bought", selection: $vinyl.bought, displayedComponents: .date)
                }
                
                HStack {
                    Text("Price Bought").foregroundStyle(.gray)
                    TextField("Enter Price", value: $vinyl.priceBought, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                TextField("Note Bought", text: $vinyl.noteBought)
            }*/
            /*
            Section(header: Text("State & Other Information")) {
                Picker("Pocket State", selection: $vinyl.pocketState) {
                    ForEach(PocketState.self, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
                Picker("State", selection: $vinyl.state) {
                    ForEach(State.self, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
                Picker("Read Speed", selection: $vinyl.readSpeed) {
                    ForEach(ReadSpeed.self, id: \.self) { pstate in
                        Text(pstate)
                    }
                }
            }
             */
            
            //ImageListView(images: $images)
        }
        .navigationBarTitle("Add Vinyl", displayMode: .large)
    }
}

#Preview {
    do {
        let previewer = try Previewer()

        return EditVinylView(vinyl: previewer.vinyl)
            .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
