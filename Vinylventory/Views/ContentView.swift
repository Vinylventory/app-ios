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
                VStack(spacing: 30) {
                    
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
                        NavigationLink(value: "albumView") {
                            ButtonView(iconName: "books.vertical.fill")
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 20) {
                        NavigationLink(value: "labelView") {
                            ButtonView(iconName: "network")
                        }
                        NavigationLink(value: "boughtView") {
                            ButtonView(iconName: "doc.text")
                        }
                        NavigationLink(value: "settingsView") {
                            ButtonView(iconName: "gear")
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationBarTitleDisplayMode(.inline)
                .padding(.bottom)
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink(value: "statView") {
                            Label("", systemImage: "chart.bar")
                        }
                        .padding()
                    }
                }
            }
            .navigationDestination(for: String.self) { str in
                switch str {
                case "vinylView": VinylView(path: $path)
                case "artistView": ArtistView(path: $path)
                case "albumView": AlbumView(path: $path)
                case "labelView": LabelGroupView(path: $path)
                case "boughtView": BoughtView(path: $path)
                case "settingsView": SettingsView(path: $path)
                case "statView": StatView(path: $path)
                default: exit(1)
                }
            }
            .navigationDestination(for: Vinyl.self) { value in
                AddOrEditVinylView(vinyl: value, add: true, path: $path)
            }
            .navigationDestination(for: EditVinyl.self) { edit in
                AddOrEditVinylView(vinyl: edit.vinyl, add: false, path: $path)
            }
            .navigationDestination(for: SeeVinyl.self) { see in
                SeeVinylView(vinyl: see.vinyl)
            }
            .navigationDestination(for: Artist.self) { value in
                AddOrEditArtistView(options: AddOrEditOptions(value: value, showPopover: { value in
                    path.removeLast()
                }, addAfter: true, addValue: { value in
                    modelContext.insert(value)
                }, revertButtons: true, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: EditArtist.self) { edit in
                AddOrEditArtistView(options: AddOrEditOptions(value: edit.artist, showPopover: { value in
                    path.removeLast()
                }, addAfter: false, addValue: { value in }, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: SeeArtist.self) { see in
                SeeArtistView(artist: see.artist)
            }
            .navigationDestination(for: Album.self) { value in
                AddOrEditAlbumView(options: AddOrEditOptions(value: value, showPopover: { value in
                    path.removeLast()
                }, addAfter: true, addValue: { value in
                    modelContext.insert(value)
                }, revertButtons: true, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: EditAlbum.self) { edit in
                AddOrEditAlbumView(options: AddOrEditOptions(value: edit.album, showPopover: { value in
                    path.removeLast()
                }, addAfter: false, addValue: { value in }, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: SeeAlbum.self) { see in
                SeeAlbumView(album: see.album)
            }
            .navigationDestination(for: LabelGroup.self) { value in
                AddOrEditLabelView(options: AddOrEditOptions(value: value, showPopover: { value in
                    path.removeLast()
                }, addAfter: true, addValue: { value in
                    modelContext.insert(value)
                }, revertButtons: true, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: EditLabelGroup.self) { edit in
                AddOrEditLabelView(options: AddOrEditOptions(value: edit.labelGroup, showPopover: { value in
                    path.removeLast()
                }, addAfter: false, addValue: { value in }, check: { value in
                    value.name.isEmpty
                }))
            }
            .navigationDestination(for: SeeLabelGroup.self) { see in
                SeeLabelGroupView(labelGroup: see.labelGroup)
            }
            .navigationDestination(for: Bought.self) { value in
                AddOrEditBoughtView(options: AddOrEditOptions(value: value, showPopover: { value in
                    path.removeLast()
                }, addAfter: true, addValue: { value in
                    modelContext.insert(value)
                }, revertButtons: true, check: { value in
                    value.loc.isEmpty
                }))
            }
            .navigationDestination(for: EditBought.self) { edit in
                AddOrEditBoughtView(options: AddOrEditOptions(value: edit.bought, showPopover: { value in
                    path.removeLast()
                }, addAfter: false, addValue: { value in }, check: { value in
                    value.loc.isEmpty
                }))
            }
            .navigationDestination(for: SeeBought.self) { see in
                SeeBoughtView(bought: see.bought)
            }
            .navigationDestination(for: SeeImage.self) { see in
                ImageView(image: see.image)
                    .ignoresSafeArea()
            }
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
                .frame(width: UIScreen.main.bounds.width / 3 - 25, height: UIScreen.main.bounds.width / 3 - 25)
            
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
