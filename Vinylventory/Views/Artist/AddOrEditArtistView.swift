//
//  AddOrEditArtistView.swift
//  Vinylventory
//
//  Created by Tom Andrivet on 03.09.2024.
//

import SwiftUI

struct AddOrEditArtistView: View {
    
    @StateObject var options: AddOrEditOptions<Artist>
    
    var body: some View {
        AddOrEditView(options: options) {
            Form {
                Section(header: Text("Informations")) {
                    TextField("Surname", text: $options.value.surname)
                    TextField("Name", text: $options.value.name)
                    TextField("Origin", text: $options.value.origin)
                }
            }
        }
    }
}
