//
//  SeeArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct SeeArtistView: View {
    
    @Bindable var artist: Artist
    
    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                HStack {
                    Text("Surname")
                    Spacer()
                    Text(artist.surname.isEmpty ? "N/A" : artist.surname)
                }
                
                HStack {
                    Text("Name")
                    Spacer()
                    Text(artist.name.isEmpty ? "N/A" : artist.name)
                }
                
                HStack {
                    Text("Origin")
                    Spacer()
                    Text(artist.origin.isEmpty ? "N/A" : artist.origin)
                }
            }
            
            Section(header: Text("Played By")) {
                if let playedBy = artist.playedBy, !playedBy.isEmpty {
                    ForEach(playedBy, id: \.self) { vinyl in
                        NavigationLink(value: SeeVinyl(vinyl: vinyl)) {
                            HStack {
                                if vinyl.label != nil {
                                    Text(vinyl.label!.name)
                                }
                                Text(vinyl.catNumber)
                            }
                        }
                    }
                } else {
                    Text("No vinyl played by this artist")
                }
            }
            
            Section(header: Text("Authored Vinyls")) {
                if let authored = artist.authored, !authored.isEmpty {
                    ForEach(authored, id: \.self) { vinyl in
                        NavigationLink(value: SeeVinyl(vinyl: vinyl)) {
                            HStack {
                                if vinyl.label != nil {
                                    Text(vinyl.label!.name)
                                }
                                Text(vinyl.catNumber)
                            }
                        }
                    }
                } else {
                    Text("No vinyl authored by this artist")
                }
            }
            Section(header: Text("Credits")) {
                if let credits = artist.credits, !credits.isEmpty {
                    ForEach(credits, id: \.self) { credit in
                        if credit.vinyl != nil {
                            NavigationLink(value: SeeVinyl(vinyl: credit.vinyl!)) {
                                HStack {
                                    if credit.vinyl!.label != nil {
                                        Text(credit.vinyl!.label!.name)
                                    }
                                    Text(credit.vinyl!.catNumber)
                                    Spacer()
                                    Text(credit.role)
                                }
                            }
                        } else {
                            Text(credit.vinyl?.catNumber ?? "Unknown")
                            Spacer()
                            Text(credit.role.isEmpty ? "Unknown" : credit.role)
                        }
                    }
                } else {
                    Text("No credits to this artist")
                }
            }
        }
        .navigationTitle(artist.surname + " " + artist.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: EditArtist(artist: artist))  {
                    Label("", systemImage: "pencil")
                }.padding()
            }
        }
    }
}
