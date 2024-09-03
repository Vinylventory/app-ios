//
//  EditAlbumView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 30.08.2024.
//

import SwiftUI

struct AddOrEditAlbumView: View {
    
    @StateObject var options: AddOrEditOptions<Album>
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Name", text: $options.value.name)
                }
            }
        }
    }
}
