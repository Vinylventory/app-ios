//
//  SettingsView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var path: NavigationPath
    
    var body: some View {
        Form {
            Section(header: Text("Server"), footer: Text("The server used during version 1.0 of the application is no longer usable. If you need help migrating your data, contact me on GitHub: https://github.com/CanardConfit")) {
            }
            
            Section(header: Text("About the app")) {
                Link("Source Code", destination: URL(string: "https://github.com/Vinylventory/app-ios/")!)
                Divider()
                HStack {
                    Text("Made by")
                    Spacer()
                    Link("CanardConfit (Tom Andrivet)", destination: URL(string: "https://github.com/CanardConfit")!)
                }
            }
        }
        .navigationBarTitle("Settings", displayMode: .large)
    }
}
