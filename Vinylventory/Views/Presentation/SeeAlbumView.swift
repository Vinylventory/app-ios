//
//  SeeAlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct SeeAlbumView: View {
    
    @Bindable var album: Album
    
    var body: some View {
        Form {
            Section(header: Text("Informations")) {
                HStack {
                    Text("Name")
                    Spacer()
                    Text(album.name.isEmpty ? "N/A" : album.name)
                }
            }
            
            Section(header: Text("Vinyls")) {
                if let vinyls = album.vinyls, !vinyls.isEmpty {
                    ForEach(vinyls, id: \.self) { vinyl in
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
                    Text("No vinyls in this album")
                }
            }
        }
        .navigationTitle("Album " + album.name)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink(value: EditAlbum(album: album))  {
                    Label("", systemImage: "pencil")
                }.padding()
            }
        }
    }
}
