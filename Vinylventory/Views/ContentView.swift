//
//  ContentView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 12.08.2024.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    
    @State private var path: NavigationPath = NavigationPath()
    
    var body: some View {
        
        NavigationStack(path: $path) {
            
            GeometryReader { geometry in
                let screenWidth = geometry.size.width
                VStack(spacing: 20) {
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: screenWidth > 375 ? 300 : 150, height: screenWidth > 375 ? 300 : 150)
                        .clipShape(Circle())
                        .padding(.top, 40)
                    
                    Text("Vinylventory")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        NavigationLink(value: "vinylView") {
                            ButtonView(iconName: "music.quarternote.3")
                        }
                        NavigationLink(value: "artistView") {
                            ButtonView(iconName: "person.3")
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        NavigationLink(value: "") {
                            ButtonView(iconName: "books.vertical.fill")
                        }
                        NavigationLink(value: "") {
                            ButtonView(iconName: "network")
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.bottom)
            }
            .navigationDestination(for: String.self) { str in
                switch str {
                case "vinylView": VinylView(path: $path)
                case "artistView": ArtistView(path: $path)
                default: exit(1)
                }
            }
            .navigationDestination(for: Vinyl.self) { vinyl in
                AddOrEditVinylView(vinyl: vinyl, add: true, path: $path)
            }
            .navigationDestination(for: EditVinyl.self) { editVinyl in
                AddOrEditVinylView(vinyl: editVinyl.vinyl, add: false, path: $path)
            }
            .navigationDestination(for: SeeVinyl.self) { seeVinyl in
                SeeVinylView(vinyl: seeVinyl.vinyl)
            }
            .navigationDestination(for: Artist.self) { artist in
                AddOrEditArtistView(artist: artist, showPopover: { value in
                    path.removeLast()
                }, addAfter: true, addArtist: {artist in
                    modelContext.insert(artist)
                }, revertButtons: true)
            }/*
            .navigationDestination(for: EditArtist.self) { editArtist in
                SeeVinylView(vinyl: editArtist.artist)
            }
            .navigationDestination(for: SeeArtist.self) { seeArtist in
                SeeArtistView(vinyl: seeArtist.artist)
            }*/
        }
    }
}

struct ButtonView: View {
    var iconName: String = ""
    var imageName: String = ""
    var disabled: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(disabled ? Color.gray : Color.blue)
                .frame(width: UIScreen.main.bounds.width / 2 - 30, height: UIScreen.main.bounds.width / 2 - 30)
            
            if iconName != "" {
                Image(systemName: iconName)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            } else if imageName != "" {
                Image(imageName)
                    .resizable()
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .frame(width: 100, height: 100)
            }
        }
        .opacity(disabled ? 0.5 : 1.0)
    }
}

#Preview {
    ContentView()
}
