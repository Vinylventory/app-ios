//
//  SettingsView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 18.08.2024.
//

import SwiftUI

struct SettingsView: View {
    
    @AppStorage("url") private var url: String = "http://192.168.1.189:4000"
    @AppStorage("token") private var token: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Server"), footer: Text("This application uses a self-hosted server, which can be found here: https://github.com/Vinylventory/backend/")) {
                TextField("URL", text: $url)
                TextField("Authentication Token", text: $token)
            }
        }
        .navigationBarTitle("Settings", displayMode: .large)
    }
}

#Preview {
    SettingsView()
}
